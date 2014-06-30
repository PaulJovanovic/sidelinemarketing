class Admin::EventPurchaseOptionsController < AdminController
  def destroy
    @purchase_option = EventPurchaseOption.find(params[:id])

    if @purchase_option.destroy
      render json: {}, status: 200
    else
      render json: { errors: @purchase_option.errors }, status: :unprocessible_entity
    end
  end
end
