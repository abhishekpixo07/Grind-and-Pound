# app/controllers/concerns/otp_authenticable.rb
module OtpAuthenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user_with_otp, only: [:create]
  end
  
  def authenticate_user_with_otp
    phone_number = params[:user][:phone_number]
    existing_user = User.find_by(phone_number: phone_number)
  
    ActiveRecord::Base.transaction do
      @user = existing_user ? send_otp_and_set_user(existing_user) : create_and_send_otp
    end
    rescue ActiveRecord::RecordInvalid => e
    render json: { errors: format_validation_errors(e.record) }, status: :unprocessable_entity
  end
  
  def send_otp_and_set_user(user)
    if user.active
      user.update!(otp: generate_random_otp)
      @user_token = create_session(user)
      # send_otp_via_twilio(user) if user.phone_number.present?
      render_response
    else
      render json: { message: 'User is inactive. Please contact support.' }, status: :ok
    end
  end
    
  # def create_and_send_otp
  #   @user = build_user(user_params)
  #   @user.otp = generate_random_otp
  #   @user.save!
  #   @user_token = create_session(@user)
  #   render_response
  #   # send_otp_via_twilio(user) if @user.phone_number.present?
  #   @user
  # end

  def create_and_send_otp
    referral_code = params[:user][:referral_code]
    @user = build_user(user_params)
    @user.otp = generate_random_otp
    @user.save!
    @user_token = create_session(@user)
    
    # Check if a referral code was provided
    if referral_code.present?
      referrer = User.find_by(referral_key: referral_code)
      if referrer.present?
        # Associate the referrer with the referred user
        Referral.create!(referrer_id: @user.id ,referred_user_id: referrer.id)
      else
        # Handle invalid referral code
        render json: { error: 'Invalid referral code' }, status: :unprocessable_entity
        return
      end
    end
    render_response
    # send_otp_via_twilio(user) if @user.phone_number.present?
    @user
  end
  
  
  def render_response
    render json: { message: 'OTP sent successfully.' }, status: :ok
  end
  

  # Other methods...

  private

  def generate_random_otp
    rand(1000..9999).to_s
  end

  def create_session(user)
      token = SecureRandom.hex(48)
      user.sessions.create(token: token)
  end

  def authenticate_user_with_token(authorization_token)
    return nil if authorization_token.blank?

    decoded_token = decode_authorization_token(authorization_token)

    return nil if decoded_token.nil?

    user_id = decoded_token['user_id']
    User.find_by(id: user_id)
  end

  def user_params
    params.require(:user).permit(:country_code, :phone_number)
  end

  def build_user(params)
    User.new(params)
  end

  def format_validation_errors(record)
    record.errors.messages.map { |field, errors| "#{field.to_s.capitalize}: #{errors.join(', ')}" }
  end

  def send_otp_via_twilio(resource)
    formatted_phone_number = "+#{resource.country_code}#{resource.phone_number}"
    $twilio_client.messages.create(
      from: '+12137845665',
      to: formatted_phone_number,
      body: "Your OTP is #{resource.otp}."
    )
  end

end
