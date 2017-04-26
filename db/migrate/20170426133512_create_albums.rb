# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.references :song, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
