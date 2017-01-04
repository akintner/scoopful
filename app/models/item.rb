class Item < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :price_per_unit, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
