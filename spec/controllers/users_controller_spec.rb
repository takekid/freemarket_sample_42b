require 'rails_helper'

describe UsersController, type: :controller do 
  describe 'Get #address, credit, finish, signin_form' do
    it "renders the :address template" do
      get :address
      expect(response).to render_template :address
    end
    it "renders the :credit template" do
      get :credit
      expect(response).to render_template :credit
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
  
  describe 'Get #address_create' do
    before do
      address = create(:address)
      get :address_create, params: { id: address}
    end
    context 'case in address is valid' do
      it 'persists a address' do
        expect(@address).to eq @address
      end  
      it 'renders address' do
        get :address
        expect(response).to render_template :address
      end
    end
    context 'when address is invalid' do
      it 'does not persists a address' do
        expect(@address).not_to receive(:save)
      end
    end    
  end
  describe 'Post #signin_form_create' do
    before do
      user = create(:user)
      get :signin_form_create, params: { id: user }
    end  
    context 'case in user is valid' do
      it 'persists a user' do
        expect(@user).to eq @user
      end
      it 'renders signin_form' do
        expect(response).to render_template :sign_in  
      end
    end
    context 'when user is invalid' do
      it 'does not persists a user' do
        expect(@user).not_to receive(:save)
      end  

      it 'renders address.html.haml' do
        expect(response).to redirect_to(users_address_path)
      end

      it 'assigns to user' do
        expect(assigns(:user)).to match_array(@user)
      end
    end
  end
  describe 'GET #show' do
  let(:item) { Hash[name: 'test'] }

  before do
    allow(Item).to receive(:find).and_return(item)
  end

  it 'returns a 200' do
    get :show, params: { id: 1 }
    expect(response).to have_http_status(200)
  end

  it 'renders show.html.erb' do
    get :show, params: { id: 1 }
    expect(response).to render_template(:show)
  end

  it 'assigns to user' do
    get :show, params: { id: 1 }
    expect(assigns(:item)).to match_array(item)
  end
end


end