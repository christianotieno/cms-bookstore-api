# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :category
end
