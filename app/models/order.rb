class Order < ApplicationRecord
  belongs_to :user
  
  validates :total_cost, presence: true
end