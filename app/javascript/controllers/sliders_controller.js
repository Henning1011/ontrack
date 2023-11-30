import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sliders"
export default class extends Controller {
  static targets = ["acousticness", "danceability", "energy", "instrumentalness", "liveness", "loudness", "speechiness", "valence", "popularity"]

  connect() {
    console.log("hello")
  }

  getvalues() {
    const acousticness = this.acousticnessTarget.value
    console.log(this.danceabilityTarget.value)
    console.log(this.energyTarget.value)
    console.log(this.instrumentalnessTarget.value)
    console.log(this.livenessTarget.value)
    console.log(this.loudnessTarget.value)
    console.log(this.speechinessTarget.value)
    console.log(this.valenceTarget.value)
    console.log(this.popularityTarget.value)
  }
}
