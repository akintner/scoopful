module ItemAnalytics

  def self.most_popular
    item_quantities = Item.joins(:orders_items).group(:item_id).sum(:quantity)
    max_quantity = item_quantities.values.max
    Item.find(item_quantities.key(max_quantity))
  end

end