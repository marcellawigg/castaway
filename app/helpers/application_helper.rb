module ApplicationHelper
  def present(object, klass = nil)
  klass ||= "#{object.class}Presenter".constantize
  presenter = klass.new(object, self)

  yield presenter if block_given?
  presenter
  end

  def cache_key_for(model_class, label = "")
    prefix = model_class.to_s.downcase.pluralize
    count = model_class.count
    max_updated = model_class.maximum(:updated_at)
    [prefix, label, count, max_updated].join("-")
  end

  def checkout_option
   if !current_user
     button_to("Log in to purchase advertisements", login_path(previous_page: "cart" ), method: :get, class: "btn btn-custom btn-person")
   else
     button_to("Checkout", new_charge_path, method: :get, class: "btn btn-custom btn-person")
   end
  end
end
