require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @category_1 = Category.create(name: 'housing')
    @category_2 = Category.create(name: 'jobs')
    @category_3 = Category.create(name: 'for sale')
  end
  
  describe "categories" do
    it 'order categories by name' do
      expect(Category.all.by_name.first).to eq(@category_3)
    end
  end

end
