class AddQuantityAndStatusToItems < ActiveRecord::Migration
  def self.up
  	add_column :items, :quantity, :integer, :default => 1
  	add_column :items, :status, :string, :default => "Waiting for approval"
  end

  def self.down
  remove_column :items, :quantity
  remove_column :items
  end
end
