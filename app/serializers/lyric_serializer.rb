class LyricSerializer < ActiveModel::Serializer
  attributes :id, :text, :translation, :song_id
end
