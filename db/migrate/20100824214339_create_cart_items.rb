class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
    	t.column :item_id, :integer
    	t.column :cart_id, :integer
    	t.column :price, :float
    	t.column :amount, :integer
    	t.column :created_at, :datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end