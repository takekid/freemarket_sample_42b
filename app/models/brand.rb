class Brand < ApplicationRecord
  has_many :brand_groups
  has_many :items
end
