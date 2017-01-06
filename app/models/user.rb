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
end