class Item < ApplicationRecord
# has_many :reviews, through: users
# has_many :likes, through: users
# has_many :comments, thorough: users
has_many :item_images
# has_many :transactions, thorough: users

belongs_to :category
belongs_to :size
belongs_to :brand
belongs_to :seller, class_name: "User",optional: true
belongs_to :buyer, class_name: "User",optional: true

mount_uploader :image, ImageUploader
end
