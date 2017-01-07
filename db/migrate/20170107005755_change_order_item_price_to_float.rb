class ChangeOrderItemPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :orders_items, :current_price_per_unit, :float
  end
end
