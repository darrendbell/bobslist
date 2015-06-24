require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
let(:category) {Category.create(name: 'Name')}
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id:category.id
      expect(response).to have_http_status(:success)
    end
    it "does not return success" do
      get :show, id: "1234"
      expect(response).to_not have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: category.id
      expect(response).to have_http_status(:success)
    end

   it "does not return http success" do
     get :show, id: '1234'
     expect(response).to_not have_http_status(:success)
   end
  end

  describe "PUT #update" do
   it 'updates category' do
     #set variable
     name = 'updated name'
     #pass params to put
     put :update, id: category.id, category: {name: name}
     #expectation
     expect(response).to have_http_status(:redirect)
     #set variable
     updated_category = category.reload
     #expectations
     expect(updated_category.name).to eq(name)
     expect(flash[:notice]).to be_present
   
    end

   it 'does not update' do
    put :update, id: category.id, category: {name: nil}
    expect(flash[:error]).to be_present

   end

  end

 describe "DELETE #destroy" do
   it 'destroys the category' do
     delete :destroy, id: category.id
     expect(Category.all.count).to eq(0)
     expect(flash[:notice]).to be_present
    end


 end


end
