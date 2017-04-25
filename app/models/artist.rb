class Artist < ApplicationRecord
  has_many :songs, through: :albums
  has_many :albums, dependent: :destroy
  validates :name, presence: true
  validates :genre, presence: true
end
