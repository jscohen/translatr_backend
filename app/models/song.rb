# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist, foreign_key: 'artist_id'
  belongs_to :user, foreign_key: 'user_id'
  validates :name, presence: true
end
