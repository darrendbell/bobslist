require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:item) {Item.create!(name: 'item name', description: 'item description', price: 'item price', category_id: 'category integer')}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "fails to return a success" do
      get :show, id: '3124354'
      expect(response).to_not have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update, id: item.id, item: {name: 'thing', description: 'about the thing', price: 'money', category: '2'}
      expect(response).to have_http_status(:redirect)
    end

    it 'fails to update item' do
      put :update, id: item.id, item: {name: nil, description: 'about the thing'}
      expect(flash[:error]).to be_present
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "successfully deletes item" do
      delete :destroy, id: item.id 
      expect(flash[:notice]).to be_present
    end
  end
end
