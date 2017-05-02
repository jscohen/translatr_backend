# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :album_id, :artist_id, :user_id
end
