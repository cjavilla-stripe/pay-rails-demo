class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @checkout_session = current_user.payment_processor.checkout(
      mode: 'payment',
      line_items: current_user.cart_line_items,
      automatic_tax: {
        enabled: true
      },
      shipping_address_collection: {
        allowed_countries: ['US', 'CA', 'MX'],
      },
      customer_update: {
        shipping: 'auto',
        address: 'auto',
      }
    )
    redirect_to @checkout_session.url, allow_other_host: true, status: :see_other
  end
end
