class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.decimal :amount
      t.integer :state_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
