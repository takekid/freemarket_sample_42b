require 'rails_helper'

describe CategoriesController, type: :controller do
  let(:category) {FactoryGirl.build(:category)}
  describe 'Get #new' do
    before do
      get :new
      allow(Category).to receive(:new).and_return(@category)
    end
    it 'returns a 302' do
      expect(response).to have_http_status(302)
    end
    it 'assigns to category' do
      expect(assigns(:category)).to eq @category
    end
  end
  describe 'Get #show' do
    before do
      get :show, params: {id: 1}
      allow(Category).to receive(:find).and_return(@category)
    end  
    it 'return a 200' do  
    expect(response).to have_http_status(200)
    end
    it 'assigns to category' do
    expect(assigns(:category)).to eq @category
    end
  end
end