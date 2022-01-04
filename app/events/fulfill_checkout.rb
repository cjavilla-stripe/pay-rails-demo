class FulfillCheckout
  def call(event)
    checkout_session = event.data.object

    # Clear cart for this user (even if the session isn't fully paid).
    # We want to clear here because we'll get the checkout.session.completed
    # event long before async_payment_succeeded in delayed payment method types.
    user = User.find_by(stripe_customer_id: checkout_session.customer)
    user.cart_items.destroy_all

    return if checkout_session.payment_status != "paid"

    # Send the customer an email with their order details.

  end
end

Pay::Webhooks.delegator.subscribe "stripe.checkout.session.async_payment_succeeded", FulfillCheckout.new
Pay::Webhooks.delegator.subscribe "stripe.checkout.session.succeeded", FulfillCheckout.new
