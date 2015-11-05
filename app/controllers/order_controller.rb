class OrderController < ApplicationController

  def new
   @order = Order.new
  end

  def create

    sales_tax=Order.sales_tax_amount(order_params[:product_id], order_params[:state_id], order_params[:quantity])
    total_price=Order.total_price(order_params[:product_id], order_params[:quantity] )
    @order = Order.new
    @order.state_id=order_params[:state_id]
    @order.product_id=order_params[:product_id]
    @order.quantity=order_params[:quantity]
    @order.sales_tax=sales_tax
    @order.total=total_price
    @order.save
    render :receipt
  end

  def receipt

  end

  def order_params
    params.require(:order).permit!
  end
end
