class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_cart_item(need_item_id, quantity)
    contents[need_item_id.to_s] ||= 0
    contents[need_item_id.to_s] += quantity.to_i
  end

  def delete_cart_item(need_item_id)
    contents.delete(need_item_id.to_s)
  end

  def change_cart_item_quantity(need_item_id, need_item_quantity)
    if need_item_quantity.to_i == 0
      contents.delete(need_item_id)
    else
      contents[need_item_id] = need_item_quantity.to_i
    end
  end

  def total_items
    contents.values.sum
  end

  def total_price
    contents.reduce(0) do |total, (item_id, quantity)|
      total + NeedItem.find(item_id).price * quantity
    end.to_f
  end

  def get_need_items
    contents.map do |need_item_id, quantity|
      CartItemHandler.new(need_item_id, quantity)
    end
  end

  def get_need_items_hash
    get_need_items.inject({}) do |hash, cart_item|
      hash[cart_item.need_item] = cart_item.quantity
      hash
    end
  end

  def get_need_list_from_cart
    get_need_items.map do |cart_item|
      cart_item.need
    end
  end
end
