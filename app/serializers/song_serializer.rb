class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :album
end