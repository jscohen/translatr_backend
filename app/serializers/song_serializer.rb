# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :album, :artist_id
  has_one :user
end
