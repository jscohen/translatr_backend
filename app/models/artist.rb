class Artist < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
  belongs_to :user
  has_many :albums, dependent: :destroy
end
