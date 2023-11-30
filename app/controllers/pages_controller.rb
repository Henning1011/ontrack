class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @tracks = RSpotify::Track.search(params[:query])
    end
  end
end
