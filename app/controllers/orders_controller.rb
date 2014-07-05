class OrdersController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @order = Order.new
    @order.build_billing_address
    @order.build_shipping_address
    if params[:event] && params[:event][:event_purchase_options].count("") != params[:event][:event_purchase_options].count
      @order.event_purchase_options = EventPurchaseOption.where(id: params[:event][:event_purchase_options])
    else
      redirect_to event_path(@event)
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @order = Order.new(order_params)

    if @order.save
      redirect_to confirmation_event_orders_path
    else
      render :new
    end
  end

  def confirmation
  end

  private

  def order_params
    params.require(:order).permit(:email, :phone_number, :credit_card_name, :credit_card_number, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_security_code, billing_address_attributes: [:first_name, :last_name, :address_1, :address_2, :city, :state, :zip], shipping_address_attributes: [:first_name, :last_name, :address_1, :address_2, :city, :state, :zip], event_purchase_option_ids: []).merge({event_id: params[:event_id]})
  end
end
