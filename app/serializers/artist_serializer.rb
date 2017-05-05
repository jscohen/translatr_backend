# frozen_string_literal: true

class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :user_id
end
