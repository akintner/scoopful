class CreateOrdersItems < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_items do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.integer :current_price_per_unit
    end
  end
end
