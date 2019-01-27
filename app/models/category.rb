class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :perent_id
  has_many :items
end
