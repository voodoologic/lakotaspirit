class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.string :category
      t.float :weight
      t.string :dimension
      t.text :short_description
      t.float :price
      t.boolean :style_slightly_vary
      t.boolean :native_style

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
