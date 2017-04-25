class Song < ApplicationRecord
  belongs_to :artist, through: :albums
  validates :name, presence: true
  validates :album, presence: true
end
