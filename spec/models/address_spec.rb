require 'rails_helper'
RSpec.describe Address, type: :model do
  describe '#address_create' do
    context 'can not save' do
      it'is invalid without postal_code' do
        address = build(:address, postal_code: "")
        address.valid?
        expect(address.errors[:postal_code]).to include("can't be blank")
      end
      it'is invalid without prefectures' do
        address = build(:address, prefectures: "")
        address.valid?
        expect(address.errors[:prefectures]).to include("can't be blank")
      end
      it'is invalid without city' do
        address = build(:address, city: "")
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end
      it'is invalid without address' do
        address = build(:address, address: "")
        address.valid?
        expect(address.errors[:address]).to include("can't be blank")
      end
    end

    context 'can save' do
      it'is valid with building' do
        expect(build(:address, building: nil)).to be_valid
      end
      it'is valid with phonenumber' do
        expect(build(:address, phonenumber: nil)).to be_valid
      end
    end
  end
end
