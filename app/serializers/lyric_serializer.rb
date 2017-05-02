# frozen_string_literal: true

class LyricSerializer < ActiveModel::Serializer
  attributes :id, :text, :translation, :song_id
end
