class UsersController < ApplicationController
  def spotify
    session[:spotify_user] = RSpotify::User.new(request.env['omniauth.auth'])
    redirect_to root_path, notice: "redirected"
    # Now you can access user's private data, create playlists and much more
  end
end
