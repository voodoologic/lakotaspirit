class AddUserLevelToUsers < ActiveRecord::Migration
#updated users so that we can measure their level
  def self.up
  		add_column :items, :user_id, :integer, :null => false
  		add_column :users, :first_name, :string, :null => false
  		add_column :users, :last_name, :string, :null => false
  		add_column :users, :user_level, :integer, :default => 1, :null => false
  end

  def self.down
    	remove_column :items, :user_id 
  		remove_column :users, :first_name
  		remove_column :users, :last_name
  		remove_column :users, :user_level
  end
end
