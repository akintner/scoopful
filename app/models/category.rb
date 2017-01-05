class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :items

  def to_param
    title.parameterize.to_s
  end

  def self.where_by_param(input)
    where(title: format(input))
  end

  def self.format(input)
    input.gsub('-', ' ').split.map {|word| word.capitalize}.join(' ')
  end
end