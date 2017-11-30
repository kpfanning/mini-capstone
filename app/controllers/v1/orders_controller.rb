class V1::OrdersController < ApplicationController
  def create
 
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"].to_f,
      subtotal: params["price"].to_f,
      tax: 0,
      total: 0
    )
    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end
end
