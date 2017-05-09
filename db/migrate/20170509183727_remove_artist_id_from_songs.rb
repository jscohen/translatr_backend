class RemoveArtistIdFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :songs, column: :artist_id
    remove_column :songs, :artist_id, :album_id
  end
end
