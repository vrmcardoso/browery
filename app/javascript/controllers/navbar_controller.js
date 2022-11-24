import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navsearch"]
  connect() {
    console.log("teste")
  }
  updateNavbar(){
    if (window.scrollY >= 250) {
      this.element.classList.add("navbar-lewagon-white")
      this.navsearchTarget.classList.remove("d-none")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
      this.navsearchTarget.classList.add("d-none")
    }
  }
}
