class OrderUserModel < ActiveRecord::Migration
  def self.up
    create_table :order_users do |t|
		t.column :user_id, :integer
		t.column :order_id, :integer
		t.column :created_at, :timestamp
		t.column :updated_at, :timestamp
		t.timestamps
    end
  end

  def self.down
    drop_table :order_users
  end
end
