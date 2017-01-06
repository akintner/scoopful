class RemoveTotalCostFromOrders < ActiveRecord::Migration[5.0]
  remove_column :orders, :total_cost
end
