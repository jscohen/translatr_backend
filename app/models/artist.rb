class Artist < ApplicationRecord
  has_many :songs
  validates :name, presence: true
  validates :genre, presence: true
end
