class BrandGroup < ApplicationRecord
  belongs_to :brand, optional: true
end
