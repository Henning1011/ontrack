class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show edit update destroy push]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    if user_signed_in?
      @playlist = Playlist.new(playlist_params)
      @playlist.user = current_user
      @playlist.save
      redirect_to playlist_path(@playlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path, status: :see_other
  end

  def push
    user = RSpotify::User.find(session[:spotify_user]["id"])

    spotify_playlist = user.create_playlist!(@playlist.name)
    # we extract the IDs of each track of the playlist:
    tracks_ids = @playlist.tracks.pluck(:spotify_id)
    # tracks becomes an array of tracks because tracks_ids is an array of IDs:
    tracks = RSpotify::Track.find(tracks_ids)
    if spotify_playlist.add_tracks!(tracks)
      flash.notice = "Your playlist #{@playlist.name} has been added to Spotify"
    else
      flash.alert = "Your playlist #{@playlist.name} could not be added to Spotify"
    end
    redirect_back(fallback_location: root_path)
  end

private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :description, :photo)
  end
end
