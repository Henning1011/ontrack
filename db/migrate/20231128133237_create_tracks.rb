class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :spotify_id
      t.string :name
      t.string :artists
      t.string :track_image
      t.string :album
      t.string :artists_genres
      t.string :preview_url
      t.float :acousticness
      t.float :danceability
      t.integer :duration_ms
      t.float :energy
      t.float :instrumentalness
      t.float :liveness
      t.float :loudness
      t.integer :mode
      t.float :speechiness
      t.float :tempo
      t.float :valence
      t.integer :popularity

      t.timestamps
    end
  end
end
