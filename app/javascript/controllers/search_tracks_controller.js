import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-tracks"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  update() {
    const url = `/search?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
