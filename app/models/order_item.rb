class OrderItem < ActiveRecord::Base
  belongs_to :show
  belongs_to :order

  def item_price
    ad_price * quantity
  end
end
