class ShowPresenter
  attr_reader :template
   def initialize(show, template)
    @show = show
    @template = template
  end
   def available
    if @show.price.nil?
      template.button_to("Podcasters, claim your podcast!", "/ads/new", params: {show_id: @show.id}, method: :get, class: "btn checkout-button")
    else
      template.button_to("Add to Cart", "/cart",
                         params: { show_id: @show.id }, class: "btn checkout-button")
      end
    end
  end
