import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["dropdown"];

  connect() {
    console.log("menu controller connected");
  }

  toggleMenu() {
    console.log("toggleMenu");
    this.dropdownTarget.classList.toggle("hidden")
  }
}
