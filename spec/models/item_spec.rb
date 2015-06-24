require 'rails_helper'

RSpec.describe Item, type: :model do
   before(:each) do
    @item_1 = Item.create(name: 'studio')
    @item_2 = Item.create(name: 'house')
    @item_3 = Item.create(name: 'office')
  end
  
  describe "categories" do
    it 'order categories by name' do
      expect(Item.all.by_name.first).to eq(@item_2)
    end
  end
end
