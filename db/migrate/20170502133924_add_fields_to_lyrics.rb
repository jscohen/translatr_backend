class AddFieldsToLyrics < ActiveRecord::Migration[5.0]
  def change
    add_column :lyrics, :title, :string
    add_column :lyrics, :artist, :string
  end
end
