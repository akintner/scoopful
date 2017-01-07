module ApplicationHelper

  def categories
    Category.all
  end

  def item_status_check(item)
    if item.active?
      button_to "Add to Cart", carts_path(item_id: item.id)
    else
      button_to "Item Retired", retired_item_path(item_id: item.id)
    end
  end

  def format_price_per_unit(item)
    if item.class.to_s == "Item"
      "#{number_to_currency(item.price_per_unit)} / lb "
    else
      "#{number_to_currency(item.current_price_per_unit)} / lb "
    end
  end

end
