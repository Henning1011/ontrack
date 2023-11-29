import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sliders"
export default class extends Controller {
  static targets = ["acousticness", "danceability", "energy", "instrumentalness", "liveness", "loudness", "speechiness", "valence", "popularity"]

  connect() {
    console.log("hello")
  }

  getValues {
    // this.acousticnessTarget.value...
  }
}
