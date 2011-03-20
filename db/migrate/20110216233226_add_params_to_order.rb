class AddParamsToOrder < ActiveRecord::Migration
  def self.up
  	add_column :orders, :params, :text
  end

  def self.down
   remove_column :orders, :params
  end
end
