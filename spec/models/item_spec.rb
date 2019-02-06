require 'rails_helper'
RSpec.describe Item do
  describe '#create' do
    context 'can not save' do
    
      it 'is invalid without name' do
        item = build(:item, name:"")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it 'is invalid without introduction' do
        item = build(:item, introduction: "")
        item.valid?
        expect(item.errors[:introduction]).to include("can't be blank")
      end
      it 'is invalid without condition' do
      	item = build(:item, condition: "")
        item.valid?
        expect(item.errors[:condition]).to include("can't be blank")
      end
      it 'is invalid without shippingfee' do
      	item = build(:item, shippingfee: "")
        item.valid?
        expect(item.errors[:shippingfee]).to include("can't be blank")
      end
      it 'is invalid without ship_from' do
      	item = build(:item, shipfrom: "")
        item.valid?
        expect(item.errors[:shipfrom]).to include("can't be blank")
      end
      it 'is invalid without shipping_date' do
        item = build(:item, shipping_date: "")
        item.valid?
        expect(item.errors[:shipping_date]).to include("can't be blank")
      end
      it 'is invalid without price' do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end
      it 'is invalid without status' do
        item = build(:item, status: "")
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end
    end    
  end
end