class ShowPresenter
  attr_reader :template

  def initialize(show, template)
    @show = show
    @template = template
  end

  def available
    if @show.price.nil?
      "No one has claimed this yet. Claim it!"
    else
      template.button_to("Add to Cart", "/cart",
                         params: { show_id: @show.id }, class: "btn btn-warning")
      end
    end
  end
