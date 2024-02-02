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
  
    render_response
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: format_validation_errors(e.record) }, status: :unprocessable_entity
  end
  
  def send_otp_and_set_user(user)
    user.update!(otp: generate_random_otp)
    @user_token = create_session(user)
    user
  end
  
  def create_and_send_otp
    @user = build_user(user_params)
    @user.otp = generate_random_otp
    @user.save!
    @user_token = create_session(@user)
    @user
  end
  
  def render_response
    render json: { message: 'OTP sent successfully.', Authorization: @user_token&.token }, status: :ok
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

end
