import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.stripe     = Stripe(document.querySelector('meta[name="stripe-key"]').content)

export { application }
