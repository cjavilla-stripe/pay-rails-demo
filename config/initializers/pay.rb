Pay.setup do |config|
  # For use in the receipt/refund/renewal mailers
  config.business_name = "Business Name"
  config.business_address = "1600 Pennsylvania Avenue NW"
  config.application_name = "My App"
  config.support_email = "helpme@example.com"

  config.send_emails = true

  config.default_product_name = "default"
  config.default_plan_name = "default"

  config.automount_routes = true
  config.routes_path = "/pay" # Only when automount_routes is true
end

class FulfillCheckout
  def call(event)
    checkout_session = event.data.object

    customer = Pay::Customer.find_by(processor_id: checkout_session.customer)
    customer.owner.clear_cart!

    return if checkout_session.payment_status != 'paid'

    # Pull from inventory
    # Print shipping labels
    # Notify in chat
  end
end

Pay::Webhooks.delegator.subscribe "stripe.checkout.session.async_payment_succeeded", FulfillCheckout.new
Pay::Webhooks.delegator.subscribe "stripe.checkout.session.completed", FulfillCheckout.new
