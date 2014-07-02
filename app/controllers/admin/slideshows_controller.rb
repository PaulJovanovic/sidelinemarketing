class Admin::SlideshowsController < AdminController
  before_action :admin_navigation

  def index
    @slideshows = Slideshow.order(:name)
  end

  def show
    @slideshow = Slideshow.find(params[:id])
  end

  private

  def admin_navigation
    @navigation = "slideshows"
  end
end
