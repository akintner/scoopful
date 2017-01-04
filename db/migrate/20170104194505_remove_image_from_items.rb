class RemoveImageFromItems < ActiveRecord::Migration[5.0]
  remove_column :items, :image_url
end
