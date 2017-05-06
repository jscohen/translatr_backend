class AddAlbumsToArtist < ActiveRecord::Migration[5.0]
  def change
    add_reference :artists, :album, foreign_key: true
  end
end
