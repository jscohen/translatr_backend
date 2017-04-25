class Album < ApplicationRecord
  belongs_to :song, inverse_of: :albums
  belongs_to :artist, inverse_of: :albums
  validates :name, presence: true
end
