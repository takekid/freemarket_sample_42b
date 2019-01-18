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
        user = create(:user)
        get :signin_form_create, params: {id: user}
        expect(response).to render_template :signin_form
      end
      it 'can save user in db and move a to b' do
        address = create(:address)
        get :address_create, params: {id: address}
        expect(response).to render_template :purchase
      end  
    end  
end