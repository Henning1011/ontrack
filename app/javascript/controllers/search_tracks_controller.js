import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-tracks"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  update() {
    console.log("Update function called");
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "application/javascript" } })
      .then(response => response.text())
      .then((data) => {
        console.log("Received data:", data);
        this.listTarget.outerHTML = data
      })
    .catch(error => console.error('Error updating:', error));
  }
}
