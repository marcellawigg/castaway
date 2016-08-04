module ApplicationHelper
  def present(object, klass = nil)
  klass ||= "#{object.class}Presenter".constantize
  presenter = klass.new(object, self)

  yield presenter if block_given?
  presenter
  end

  def checkout_option
   if !current_user
     button_to("Log in to purchase advertisements", login_path(previous_page: "cart" ), method: :get, class: "btn checkout-button")
   else
     button_to("Checkout", new_charge_path, method: :get, class: "btn checkout-button")
   end
  end
end
