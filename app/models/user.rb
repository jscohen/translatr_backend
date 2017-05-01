# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :albums
  has_many :artists
end
