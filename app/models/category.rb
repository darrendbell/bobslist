class Category < ActiveRecord::Base
  validates_presence_of :name 
  def self.by_name
    order(:name)
  end
end
