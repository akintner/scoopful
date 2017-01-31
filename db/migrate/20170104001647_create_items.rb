class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.float :price_per_unit

      t.timestamps
    end
  end
end
