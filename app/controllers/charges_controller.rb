class ChargesController < ApplicationController
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
    @amount = @cart.total_price
    @cart_contents = @cart.contents
  end

  def create
  unless current_user.has_payment_info?
    @result = Braintree::Transaction.sale(
                amount: @cart.total_price,
                payment_method_nonce: params[:payment_method_nonce],
                customer: {
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  company: params[:company],
                  email: params[:email],
                  phone: params[:phone]
                },
                options: {
                  store_in_vault: true
                })
  else
    @result = Braintree::Transaction.sale(
                amount: @cart.total_price,
                payment_method_nonce: params[:payment_method_nonce])
  end

  if @result.success?
    current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
    redirect_to root_path, notice: "Congratulations! Your transaction has been successfully completed!"
    session.delete(:cart)
  else
    flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
    gon.client_token = generate_client_token
    render :new
  end
end

private
  def generate_client_token
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
    end
  end

  def check_cart!
    if @cart.contents.empty?
      redirect_to root_path
    end
  end
end
