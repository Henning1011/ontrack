class AddUriToTracks < ActiveRecord::Migration[7.1]
  def change
    add_column :tracks, :uri, :string
  end
end
