class Album < ApplicationRecord
  has_many :songs, foreign_key: 'song_id'
  belongs_to :artist, inverse_of: :albums
  validates :name, presence: true
end
