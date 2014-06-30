class Admin::PhotosController < AdminController
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json do
          render json: { id: @photo.id, thumb: @photo.attachment.url(:medium) }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      render json: { }, status: 200
    else
      render json: { errors: @photo.errors }, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:attachment, :assetable_type, :assetable_id)
  end
end
