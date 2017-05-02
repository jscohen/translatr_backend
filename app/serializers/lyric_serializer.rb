class LyricSerializer < ActiveModel::Serializer
  attributes :id, :text, :translation
end
