class AddTextToLyrics < ActiveRecord::Migration[5.0]
  def change
    add_column :lyrics, :text, :string
  end
end
