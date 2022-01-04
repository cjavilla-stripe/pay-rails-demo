

Pay::Webhooks.delegator.subscribe "stripe.checkout.session.async_payment_succeeded", FulfillCheckout.new
Pay::Webhooks.delegator.subscribe "stripe.checkout.session.succeeded", FulfillCheckout.new

class FulfillCheckout
  def call(event)
    checkout_session = event.data.object

    return checkout_session.payment_status != "paid"
  end
end
