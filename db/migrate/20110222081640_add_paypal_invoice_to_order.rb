class AddPaypalInvoiceToOrder < ActiveRecord::Migration
  def self.up
  	add_column :orders, :paypal_invoice, :integer
  end

  def self.down
  	remove_column :orders, :paypal_invoice
  end
end
