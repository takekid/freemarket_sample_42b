require 'rails_helper'
RSpec.describe Category, type: :model do
  describe '#new' do
    it 'is invalid without category_name' do
      category_name = build(:category, category_name: category_name)
      category_name.valid?
      expect(category_name.errors[:category_name]).to include("can't be blank")
    end 
  end	
end	