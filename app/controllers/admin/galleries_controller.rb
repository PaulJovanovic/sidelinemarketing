class Admin::GalleriesController < AdminController
  before_action :admin_navigation

  def index
    @galleries = Gallery.order("created_at desc")
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.order("created_at desc")
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to admin_galleries_path
    else
      render :new
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end

  def admin_navigation
    @navigation = "galleries"
  end

end
