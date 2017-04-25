class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist_id, :song_id
end
