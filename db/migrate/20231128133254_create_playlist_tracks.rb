class CreatePlaylistTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :playlist_tracks do |t|
      t.references :track, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
