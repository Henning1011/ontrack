class PlaylistsController < ApplicationController
  # just to change something - delete me
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    if user_signed_in?
      @playlist = Playlist.new(playlist_params)
      @playlist.user = current_user
      @playlist.save
      redirect_to playlists_path(@playlist)
    else
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)

    redirect_to playlist_path(@playlist)
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to playlists_path
  end
private

  def playlist_params
    params.require(:playlist).permit(:name, :description, :playlist_image)
  end
end
