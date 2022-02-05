class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new

  end

  def create
    order = Order.new(order_params)
    order.save
    cart_items = current_customer.cart_items
    cart_items. each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = order.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def index
    @orders = current_customer.orders

  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details.all
    # @total_price = order.total_paymen.to_i - order.shopping_cost.to_i
    @total_price = 0
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = @address.postal_code #空の@order.postal_codeに@address.postal_codeを代入している
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = current_customer.cart_items
    @total_price = 0
    @order.shopping_cost = 800
    render :confirm
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method )
  end
end
