class Item < ActiveRecord::Base

  def self.by_name
    order(:name)
  end

end
