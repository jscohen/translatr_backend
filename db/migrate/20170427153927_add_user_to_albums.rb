class AddUserToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :album, foreign_key: true
  end
end
