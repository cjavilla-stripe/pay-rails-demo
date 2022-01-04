import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-payment-method"
export default class extends Controller {
  static targets = ['paymentElement', 'errors'];
  static values = {
    clientSecret: String,
    returnUrl: String
  }

  connect() {
    console.log(this.clientSecretValue);
    this.elements = stripe.elements({
      clientSecret: this.clientSecretValue,
      appearance: {
        theme: 'stripe'
      }
    });
    this.paymentElement = this.elements.create('payment')
    this.paymentElement.mount(this.paymentElementTarget);
  }

  async submit(e) {
    e.preventDefault();
    console.log("confirming setup...");

    const {error} = await stripe.confirmSetup({
      //`Elements` instance that was used to create the Payment Element
      elements: this.elements,
      confirmParams: {
        return_url: this.returnUrlValue
      }
    });

    console.log("setup confirmed");

    if (error) {
      console.log("error confirming setup", error.message);
      // This point will only be reached if there is an immediate error when
      // confirming the payment. Show error to your customer (e.g., payment
      // details incomplete)
      this.errorsTarget.textContent = error.message;
      return;
    }

    console.log("submitting form..");
    this.element.submit();
  }
}
