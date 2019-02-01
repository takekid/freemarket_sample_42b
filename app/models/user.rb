class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :address
  has_many :creditcards

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :salling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"


def self.from_omniauth(auth)
  user = User.where(uid: auth.uid, provider: auth.provider).first

  unless user
    user = User.create(
      nickname:  "shouya",
      uid:       auth.uid,
      provider:  auth.provider,
      email:     User.dummy_email(auth),
      password:  Devise.friendly_token[0, 20]
      )
  end
   user
end

def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.create(nickname: "shouya",
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
