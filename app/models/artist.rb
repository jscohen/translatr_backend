class Artist < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
end
