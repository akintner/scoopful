class Item < ApplicationRecord
  # belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :price_per_unit, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
