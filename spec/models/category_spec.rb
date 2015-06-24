require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {@category_1 = Category.create!(name: 'housing')}
  let(:category) {@category_2 = Category.create!(name: 'jobs')}
  let(:category) {@category_3 = Category.create!(name: 'for sale')}

  describe "categories" do
    binding.pry
    it 'order categories by name' do
      expect(Category.all.by_name.first).to eq(@category_3)
    end
  end

end
