class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :total_cost

      t.timestamps, null: false
    end
  end
end
