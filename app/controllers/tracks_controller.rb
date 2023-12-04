class TracksController < ApplicationController
  before_action :set_track, only: %i[index]

  def index
  end

  def search
    # binding.pry
    if params[:query].present?
      @tracks = RSpotify::Track.search(params[:query])
    end
  end

  def enhanced_search
    @recommendations = RSpotify::Recommendations.generate(
      seed_tracks: [params[:spotify_id]],
      target_acousticness: params[:acousticness],
      target_danceability: params[:danceability],
      target_energy: params[:energy],
      target_instrumentalness: params[:instrumentalness],
      target_liveness: params[:liveness],
      target_loudness: params[:loudness],
      target_speechiness: params[:speechiness],
      target_valence: params[:valence],
      target_popularity: params[:popularity]
    )
  end

  private

  def set_track
    @track = RSpotify::Track.find(params[:query])
  end
end
