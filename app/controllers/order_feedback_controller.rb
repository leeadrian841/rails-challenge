# Dummy Model
Order = Struct.new(:id, :date, :order_items)
OrderItem = Struct.new(:id, :meal_name)

class OrderFeedbackController < ApplicationController
  def index
    @feedbacks = OrderFeedback.all
  end

  def new
    @order = find_order(params[:order_id])
    @feedback = OrderFeedback.new
  end

  def create
    @feedback = OrderFeedback.new(order_feedback_params)
    @feedback.order_id = order_feedback_params[:order_id]

    if @feedback.save
      redirect_to order_feedback_index_path
    end
  end

  private

  def find_order(order_id)
    # Will return an Order Model or nil
    # feel free to implement this with ActiveRecord if this is insufficient

    Order.new(
      "GO#{order_id}",
      Date.new(2016, 4, 10),
      [ OrderItem.new(101, "Samsui Chicken Rice"), OrderItem.new(121, "Grilled Farm Fresh Chicken") ]
    )
  end

  def order_feedback_params
    params.require(:order_feedback).permit(:order_id, :delivery_rating, :comment)
  end
end
