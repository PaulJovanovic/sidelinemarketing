class Admin::OrdersController < AdminController
  before_action :admin_navigation

  def index
    @orders = Order.all.includes(:event).paginate(page: params[:page], per_page: 25).order("created_at desc")
    respond_to do |format|
      format.html
      format.csv { send_data Order.all.order("created_at desc").to_csv }
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def admin_navigation
    @navigation = "orders"
  end
end
