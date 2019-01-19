class Category < ApplicationRecord
  has_many :items
  has_many :categories
  belongs_to :category
end
