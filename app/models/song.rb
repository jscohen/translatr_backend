class Song < ApplicationRecord
  belongs_to :artists, foreign_key: 'artist_id'
  validates :name, presence: true
end
