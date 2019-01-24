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
end