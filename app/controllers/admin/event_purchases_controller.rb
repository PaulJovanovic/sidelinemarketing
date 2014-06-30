class Admin::EventPurchasesController < AdminController
  def new
    @event = Event.find(params[:event_id])
    @purchase = EventPurchase.new
    @purchase.options = [EventPurchaseOption.new(quantity: 1)]
  end

  def create
    @event = Event.find(params[:event_id])
    @purchase = EventPurchase.new(event_purchase_params)
    @purchase.event = @event

    if @purchase.save
      redirect_to admin_event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @purchase = EventPurchase.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @purchase = EventPurchase.find(params[:id])

    if @purchase.update_attributes(event_purchase_params)
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  private

  def event_purchase_params
    params.require(:event_purchase).permit(:name, :description, options_attributes: [:id, :quantity, :price])
  end
end
