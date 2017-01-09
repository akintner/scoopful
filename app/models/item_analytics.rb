module ItemAnalytics

  def self.most_popular
    Item.find(Item.joins(:orders_items).group(:item_id).sum(:quantity).max_by{|k,v| v}.first)
  end

end