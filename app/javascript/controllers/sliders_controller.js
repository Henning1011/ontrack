import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sliders"
export default class extends Controller {
  static targets = ["acousticness", "danceability", "energy", "instrumentalness", "liveness", "loudness", "speechiness", "valence", "popularity", "results"]
  static values = { id: String }

  connect() {
  }

  search(event) {
    const spotifyId = this.idValue
    const v_acousticness = this.acousticnessTarget.value
    const v_danceability = this.danceabilityTarget.value
    const v_energy = this.energyTarget.value
    const v_instrumentalness = this.instrumentalnessTarget.value
    const v_liveness = this.livenessTarget.value
    const v_loudness = this.loudnessTarget.value
    const v_speechiness = this.speechinessTarget.value
    const v_valence = this.valenceTarget.value
    const v_popularity = this.popularityTarget.value

    const url = `https://api.spotify.com/v1/recommendations?limit=10&seed_tracks=${spotifyId}&target_acousticness=${v_acousticness}&target_danceability=${v_danceability}&target_energy=${v_energy}&target_instrumentalness=${v_instrumentalness}&target_liveness=${v_liveness}&target_loudness=${v_loudness}&target_popularity=${v_popularity}&target_speechiness=${v_speechiness}&target_valence=${v_valence}`
    fetch(url, {
      method: "GET",
      headers: { "Authorization": "Bearer BQAUArUWCIi6w9mXYkUV71WI7RnFtSZm3me43nqVC2lm7SmHi1-bkkG9Jbg0sC6S-zTUyt0Q4podiXIoyMdzvPop7R9CvjwJ0HrdKbppKEqcff3UIF0" },
    })
    .then(response => response.json())
    .then((data) => {
      data.tracks.forEach((track) => {
        const iframeTemplate = `
        <div class="my-3">
          <iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/${track.id}?utm_source=generator" width="100%" height="80" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
        </div>
        `
        this.resultsTarget.insertAdjacentHTML("beforeend", iframeTemplate)
      });
    })
  }
}
