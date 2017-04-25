class Song < ApplicationRecord
  validates :name, presence: true
  validates :album, presence: true
end
