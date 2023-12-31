class PlaylistTracksController < ApplicationController
  before_action :set_playlist_track, only: [:destroy]

  def create
    # get selected playlist
    playlist = Playlist.find(params[:playlist_id])
    # get track
    spotify_track = RSpotify::Track.find(params[:spotify_id])

    if Track.find_by(spotify_id:params[:spotify_id]).nil?
      track = Track.new(
        spotify_id: spotify_track.id,
        name: spotify_track.name,
        artists: spotify_track.artists,
        track_image: spotify_track.album.images.first["url"],
        album: spotify_track.album.name,
        artists_genres: spotify_track.artists.first.genres.join(", "),
        preview_url: spotify_track.preview_url,
        acousticness: spotify_track.audio_features.acousticness,
        danceability: spotify_track.audio_features.danceability,
        duration_ms: spotify_track.audio_features.duration_ms,
        energy: spotify_track.audio_features.energy,
        instrumentalness: spotify_track.audio_features.instrumentalness,
        liveness: spotify_track.audio_features.liveness,
        loudness: spotify_track.audio_features.loudness,
        mode: spotify_track.audio_features.mode,
        speechiness: spotify_track.audio_features.speechiness,
        tempo: spotify_track.audio_features.tempo,
        valence: spotify_track.audio_features.valence,
        popularity: spotify_track.popularity,
        uri: spotify_track.uri
      )
      track.save
    else
      track = Track.find_by(spotify_id:params[:spotify_id])
    end

    # save track to playlist
    playlist_track = PlaylistTrack.create(playlist_id: playlist.id, track_id: track.id)
    if playlist_track.save
      flash.notice = "#{track.name} has been added to #{playlist.name}"
    else
      flash.alert = "#{track.name} could not be saved to #{playlist.name}"
    #   redirect_to "tracks/enhanced_search", notice: "#{track.name} has been added to #{playlist.name}"
    # else
    #   redirect_to "tracks/enhanced_search", alert: "#{track.name} could not be saved to #{playlist.name}"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @playlist_track.destroy
    redirect_to playlist_path(@playlist_track.playlist), notice: 'Track removed from playlist.'
  end

  private

  def set_playlist_track
    @playlist_track = PlaylistTrack.find(params[:id])
  end
end
