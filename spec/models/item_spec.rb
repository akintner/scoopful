require 'rails_helper'

RSpec.describe Item, type: :model do
  
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :image_url }
    it { is_expected.to validate_presence_of :price_per_unit }
  end

  context "associations" do
    it { should belong_to :category }
    # it { should have_many :order_items }
    # it { should have_many :orders }
  end
end


