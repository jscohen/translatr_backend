class Song < ApplicationRecord
  belongs_to :artists, foreign_key: 'artist_id'
  belongs_to :albums, foreign_key: 'song_id'
  validates :name, presence: true
  validates :album, presence: true
end
