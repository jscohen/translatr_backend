class AddLyricsToSong < ActiveRecord::Migration[5.0]
  def change
    add_reference :lyrics, :song, foreign_key: true
  end
end
