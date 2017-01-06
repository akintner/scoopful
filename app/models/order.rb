class Order < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :total_cost, presence: true
end