require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#signin_form_create' do
    context 'can not save' do
      it'is invalid without email' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank") 
      end
      it'is invalid without nickname' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it'is invalid witout name' do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end 
      it'is invalid witout kana_name' do
        user = build(:user, kana_name: "")
        user.valid?
        expect(user.errors[:kana_name]).to include("can't be blank")
      end 
      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end  
    end
  end
end
