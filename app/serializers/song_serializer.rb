# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :album, :user_id
end
