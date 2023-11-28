class PlaylistTrack < ApplicationRecord
  belongs_to :track
  belongs_to :playlist

  validates_uniqueness_of :track_id, :scope => [:playlist_id]
end
