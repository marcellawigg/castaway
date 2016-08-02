class Order < ActiveRecord::Base
  belongs_to :user
  has_many :shows, through: :order_items
  has_many :order_items

  def total_price
    order_items.map do |order_item|
      order_item.quantity * order_item.show_price.to_f
    end.reduce(:+)
  end

  def total_quantity
    order_items.map(&:quantity).reduce(:+)
  end

  def create_order_items(cart_contents)
    cart_contents.map do |show_id, quantity|
      OrderItem.create(order_id:    id,
                       show_id:     show_id,
                       quantity:    quantity,
                       show_price:  Show.find(show_id).price)
    end
  end

  def updated
    if status == "completed" || status == "cancelled"
      "This order was updated to the status of #{status} at
      #{updated_at.strftime('%A, %B %d, %Y at %I:%M%p')}."
    end
  end
end
