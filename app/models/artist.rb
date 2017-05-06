class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates :genre, presence: true
  belongs_to :user
  has_many :albums, dependent: :destroy
end
