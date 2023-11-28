class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.text :description
      t.string :playlist_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
