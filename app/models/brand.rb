class Brand < ApplicationRecord
  has_many :brand_groups
  has_many :items
  accepts_nested_attributes_for :items
end
