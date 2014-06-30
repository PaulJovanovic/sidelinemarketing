class Admin::OrdersController < AdminController
  def index
    @orders = Order.all.includes(:event).paginate(page: params[:page], per_page: 25).order("created_at desc")
  end

  def show
    @order = Order.find(params[:id])
  end
end
