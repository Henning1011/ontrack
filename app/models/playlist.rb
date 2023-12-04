class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks
  has_one_attached :playlist_image

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
