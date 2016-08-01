class Cart < OpenStruct
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end
end
