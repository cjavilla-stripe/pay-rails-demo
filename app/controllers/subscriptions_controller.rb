class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @checkout_session = current_user.payment_processor.checkout(
      mode: 'subscription',
      line_items: [{
        price: params[:price],
        quantity: 1,
      }],
      automatic_tax: {
        enabled: true
      },
      customer_update: {
        shipping: 'auto',
        address: 'auto',
      },
      cancel_url: pricing_url,
    )
    redirect_to @checkout_session.url, allow_other_host: true, status: :see_other
  end

  def show
    @subscription = current_user.payment_processor.subscription
    @price = Stripe::Price.retrieve(id: @subscription.processor_plan, expand: ['product'])
  end

  def manage
    portal_session = current_user.payment_processor.billing_portal(
      return_url: subscription_url,
    )

    redirect_to portal_session.url, allow_other_host: true, status: :see_other
  end
end
