# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
