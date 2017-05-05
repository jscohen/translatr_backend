# frozen_string_literal: true

class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_one :songs
  has_one :artist
end
