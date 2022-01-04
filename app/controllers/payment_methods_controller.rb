class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @setup_intent = Stripe::SetupIntent.create(
      customer: current_user.pay_customers.first.customer.id,
      metadata: {
        user_id: current_user.id
      }
    )
  end

  def update
    @payment_method = current_user.pay_customers.first.payment_methods.find(params[:id])
    @payment_method.make_default!
    redirect_to payment_methods_path
  end
end
