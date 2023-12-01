import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sliders"
export default class extends Controller {
  static targets = ["acousticness", "danceability", "energy", "instrumentalness", "liveness", "loudness", "speechiness", "valence", "popularity", "results"]
  static values = { id: String }

  connect() {
    console.log("hello")
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
      headers: { "Authorization": "Bearer BQA-vtYxsQ9FYoocLD_xhQtf1F8ffU_75iXQKvWTO6M_1kO0pQ6LoVonMVUqtdMmbXVyML2UzGL5MtYmpP1rjpIXiV3AtXFX68R0r73czJROnMyH_ho" },
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      const iframeTemplate = `
      <div class="col-sm-8 my-3">
      <iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/${data}?utm_source=generator" width="100%" height="250" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
    </div>
      `
      
      })
    }

  // private

  // #getvalues() {
  //   const v_acousticness = this.acousticnessTarget.value
  //   const v_danceability = this.danceabilityTarget.value
  //   const v_energy = this.energyTarget.value
  //   const v_instrumentalness = this.instrumentalnessTarget.value
  //   const v_liveness = this.livenessTarget.value
  //   const v_loudness = this.loudnessTarget.value
  //   const v_speechiness = this.speechinessTarget.value
  //   const v_valence = this.valenceTarget.value
  //   const v_popularity = this.popularityTarget.value
  // }
}
