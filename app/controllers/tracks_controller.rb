class TracksController < ApplicationController
  before_action :set_track, only: %i[index]

  def index
    respond_to do |format|
      format.html
      format.text { render partial: "tracks/search", locals: {tracks: @tracks}, formats: [:html] }
    end
  end

  def search
    if params[:query].present?
    @tracks = RSpotify::Track.search(params[:query])
    end
  end

  private

  def set_track
    @track = RSpotify::Track.find(params[:query])
  end
end
