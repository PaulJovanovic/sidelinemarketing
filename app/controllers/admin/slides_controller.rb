class Admin::SlidesController < AdminController
  before_action :admin_navigation

  def new
    @slideshow = Slideshow.find(params[:slideshow_id])
    @slide = Slide.new
  end

  def create
    @slideshow = Slideshow.find(params[:slideshow_id])
    @slide = Slide.new(slide_params)

    if @slide.save
      redirect_to admin_slideshow_path(@slideshow)
    else
      render :new
    end
  end

  def edit
    @slideshow = Slideshow.find(params[:slideshow_id])
    @slide = Slide.find(params[:id])
  end

  def update
    @slideshow = Slideshow.find(params[:slideshow_id])
    @slide = Slide.find(params[:id])

    if @slide.update_attributes(slide_params)
      redirect_to admin_slideshow_path(@slideshow)
    else
      render :edit
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    @slideshow = Slideshow.find(params[:slideshow_id])

    @organization.destroy
    redirect_to admin_slideshow_path(@slideshow)
  end

  def placements
    params[:sortable].each_with_index do |id, index|
      Slide.find(id).update_column(:placement, index + 1)
    end

    render json: true
  end

  private

  def slide_params
    params.require(:slide).permit(:name, :attachment, :assetable_type, :assetable_id)
  end

  def admin_navigation
    @navigation = "slideshows"
  end
end
