class Book < ApplicationRecord
  validates :title, :category, presence: true
end
