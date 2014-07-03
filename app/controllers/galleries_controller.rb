class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.order(:placement)
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.order("created_at desc")
  end
end
