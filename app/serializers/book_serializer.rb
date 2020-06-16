class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :category
end