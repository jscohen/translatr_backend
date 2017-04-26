class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :song
  has_one :artist
end
