class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation.subject
  #
  def confirmation(checkout_session)
    @checkout_session = checkout_session

    mail to: @checkout_session.customer_details.email, subject: "Order Confirmation"
  end
end
