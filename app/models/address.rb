class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates  :prefectures,   presence: true
  validates  :postal_code,   presence: true
  validates  :city,          presence: true
  validates  :address,       presence: true
  validates :name,       presence: true
  validates :kana_name,  presence: true
end
