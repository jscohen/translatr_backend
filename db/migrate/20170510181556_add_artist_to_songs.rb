class AddArtistToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :artist, :string
  end
end
