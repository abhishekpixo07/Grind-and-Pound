class OrderMailer < ApplicationMailer
  def order_status(user, order)
    @user = user
    @order = order
    @status = order.status
    mail(to: user.email, subject: "Order Status: #{@status}", template_name: 'order_status')
  end
end
