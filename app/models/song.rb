# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  validates :name, presence: true
  has_one :lyric, dependent: :destroy
end
