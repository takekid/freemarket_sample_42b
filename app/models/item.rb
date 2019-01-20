class Item < ApplicationRecord
# has_many :reviews, through: users
# has_many :likes, through: users
# has_many :comments, thorough: users
has_many :item_images
has_many :sizes
# has_many :transactions, thorough: users
has_many :categories

belongs_to :size
belongs_to :brand
belongs_to :seller, class_name: "User"
belongs_to :buyer, class_name: "User"
end
