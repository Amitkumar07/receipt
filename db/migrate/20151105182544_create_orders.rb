class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :state_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
