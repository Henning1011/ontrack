class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show edit update destroy]

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

private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :description, :photo)
  end
end
