class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  has_many :orders

  enum role: %w(default admin)

  def name
    "#{first_name} #{last_name}"
  end

  def verified?(params_id)
    id == params_id.to_i
  end

  def sorted_orders
    orders.order('updated_at DESC')
  end
end