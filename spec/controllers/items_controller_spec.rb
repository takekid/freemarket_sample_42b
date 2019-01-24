require 'rails_helper'

describe ItemsController do
  describe 'Get #index' do
    it "populates an array of items ordered by updated_at DESC" do
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'Get #show' do
    it '@itemに要求されたitemを割り当てること' do
      expect(assigns(:item)).to eq @item
    end
    it 'renders the :show template' do
      expect(response).to render_template :show["id"]
    end
  end
  describe 'Get #edit' do
    it '@itemに要求されたitemを割り当てること' do
      expect(assigns(:item)).to eq @item
    end
    it 'renders the :edit template' do
      expect(response).to render_template :edit["id"]
    end
  end

 describe 'Patch #update' do
  context 'available item' do
    before do
      @item = create(:item)
      @originalname = @item.name
    end
    context 'valid parameter' do
      it 'requests 200 has to be redirect' do
        expect(response.status).to eq 200
      end
      it 'updates the datebase' do
        @item.reload
        expect(@item.name).to eq 'hello item!'
      end
    end
  end
end

  describe 'Delete #destroy' do
    context 'available item' do
      it 'deletes from datebase' do
        expect { delete :destroy
         }.to change(Item, :count).by(-1)
      end
      it 'redirect to users#show'do
        redirect_to users_show_path
      end
    end
  end
end
