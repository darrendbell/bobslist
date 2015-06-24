class Item < ActiveRecord::Base

  validates_presence_of :name, :description, :price

  def self.by_name
    order(:name)
  end

end
