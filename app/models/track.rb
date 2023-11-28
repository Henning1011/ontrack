class Track < ApplicationRecord
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks

  validates :spotify_id, presence: true, uniqueness: true
  validates :name, presence: true
end
