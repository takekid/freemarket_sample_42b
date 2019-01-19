require 'rails_helper'

describe UsersController, type: :controller do 
  describe 'Get #address, purchase, finish, signin_form' do
  	it "renders the :address template" do
  	  get :address
      expect(response).to render_template :address
    end
    it "renders the :purchase template" do
  	  get :purchase
      expect(response).to render_template :purchase
    end
    it "renders the :finish template" do
  	  get :finish
      expect(response).to render_template :finish
    end
    it "renders the :signin_form template" do
  	  get :signin_form
      expect(response).to render_template :signin_form
    end
  end  


  describe 'Get #signin_form_create, address_create' do
    it 'can move a to b' do
      get :signin_form_create
      expect(response).to render_template :signin_form
    end
    it 'can move a to b' do
      get :address_create
      expect(response).to render_template :purchase
    end
    it 'assigns the requested messsage to @user' do
      user = create(:user)
      get :signin_form_create, params: {id: user}
      expect(assigns(:user)).to be_a_new(User)
    end
    it 'assigns the requested messsage to @address' do
      address = create(:address)
      get :address_create, params: {id: address}
      expect(assigns(:address)).to be_a_new(Address)
    end
    it 'can save user info in db' do
      user = create(:user)
      get :signin_form_create 
      expect{post :signin_form_create, params: {id: 1}}.to change(User, :count).by(1)
    end
    it 'can save address info in db' do
      address = create(:address)
      get :address_create 
      expect{post :address_create, params: {id: 1}}.to change(Address, :count).by(1)
    end
  end  
end