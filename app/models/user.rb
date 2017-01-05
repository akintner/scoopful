class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password

  def name
    "#{first_name} #{last_name}"
  end
end