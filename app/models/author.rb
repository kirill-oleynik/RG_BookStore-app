# frozen_string_literal: true

# Author of a book entity
class Author < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
