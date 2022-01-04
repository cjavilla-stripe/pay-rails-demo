import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["dropdown"];

  connect() {
  }

  toggleMenu() {
    this.dropdownTarget.classList.toggle("hidden")
  }
}
