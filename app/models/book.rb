# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :category, presence: true
end
