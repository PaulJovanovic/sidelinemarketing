class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.order("created_at desc")
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos.order("created_at desc")
  end
end
