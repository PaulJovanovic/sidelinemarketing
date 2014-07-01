class Admin::PagesController < AdminController
  before_action :admin_navigation

  def index
    @pages = Page.order(:name)
  end

  def show
    @page = Page.find(params[:id])
  end

  private

  def admin_navigation
    @navigation = "pages"
  end
end
