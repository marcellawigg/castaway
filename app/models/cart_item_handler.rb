class CartItemHandler < SimpleDelegator

  attr_reader :show, :quantity

  def initialize(show_id, quantity)
    @show  = Show.find(show_id)
    @quantity = quantity
    super(show)
  end
end
