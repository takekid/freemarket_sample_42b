class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,      presence: true
  validates :nickname,   presence: true
  validates :name,       presence: true
  validates :kana_name,  presence: true
  

  has_many :addresses


end
