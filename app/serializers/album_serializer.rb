# frozen_string_literal: true

class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :song
  has_one :artist
  has_one :user
end
