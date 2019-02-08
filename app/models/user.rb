class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :proceeds
  has_many :addresses
  has_many :creditcards

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :salling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"


  validates :nickname,                presence: true, length: { maximum: 6 }
  validates :email,                   presence: true, uniqueness: true
  validates :password,                presence: true, length: { in: 6..20 }
  validates :password_confirmation,   confirmation: true, presence: true

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        nickname:  auth.name,
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
      user = User.create(nickname: auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def self.add_token(card, customer, params)
     token = Payjp::Token.create({
    :card => {
      :number => params[:number],
      :cvc => params[:cvc],
      :exp_month => params[:exp_month],
      :exp_year => params[:exp_year]
      }},
      {
      'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
    customer.cards.create(
      card: token.id
    )
  end



  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
