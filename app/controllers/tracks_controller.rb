class TracksController < ApplicationController
  before_action :set_track, only: %i[index]

  def index
  end

  private

  def set_track
    @track = RSpotify::Track.find(params[:query])
  end
end
