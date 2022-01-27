class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def create

  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_option] == "1"
      @order.postal_code = @address.postal_code #空の@order.postal_codeに@address.postal_codeを代入している
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, )
  end
end
