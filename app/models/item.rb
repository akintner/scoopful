class Item < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  
  belongs_to :category
  has_many :orders_items
  has_many :orders, through: :orders_items

  validates :name, presence: true, uniqueness: true
  validates :price_per_unit, presence: true
  validates :description, presence: true
  validates :image, presence: true

  enum status: %w(active retired)

end