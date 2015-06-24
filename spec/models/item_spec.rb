require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item_1) {Item.create(name: 'studio')}
  let(:item_2) {Item.create(name: 'house')}
  let(:item_3) {Item.create(name: 'office')}
  
  describe "items" do
    it 'order items by name' do
      item_1
      item_2
      item_3
      expect(Item.all.by_name.first).to eq(item_2)
    end
  end
end
