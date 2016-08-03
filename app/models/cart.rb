class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_show(show_id)
    contents[show_id.to_s] ||= 0
    contents[show_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(show_id)
    contents[show_id.to_s]
  end

  def shows
    contents.map { |show_id, _quantity| Show.find(show_id) }
  end

  def total_price
    shows.map do |show|
      count_of(show.id) * show.price.to_f.round(2)
    end.reduce(:+)
  end

  def remove_show(show_id)
    contents.delete_if { |id, _quantity| id == show_id.to_s }
  end

  def update_quantity(id, direction)
    if direction == "plus"
      contents[id.to_s] += 1
    elsif direction == "minus" && one?(id)
      remove_show(id)
    else
      contents[id.to_s] -= 1
    end
  end

  def one?(id)
    contents[id.to_s] == 1
  end
end
