# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist, foreign_key: 'artist_id'
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :album, foreign_key: 'album_id'
  validates :name, presence: true
  has_many :lyrics, dependent: :destroy
end
