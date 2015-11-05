class AddSalesTaxToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sales_tax, :decimal
  end
end
