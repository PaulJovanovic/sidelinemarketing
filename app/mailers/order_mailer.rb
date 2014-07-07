class OrderMailer < ActionMailer::Base
  default from: "sidelinemktg@gmail.com"

  def order_confirmation_email(order)
    @order = order
    @url  = "http://example.com/login"
    mail(to: @order.email, subject: "Sideline Marketing Order ##{@order.id}")
  end
end
