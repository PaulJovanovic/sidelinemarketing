class Admin::EventsController < AdminController
  before_action :admin_navigation

  def index
    @pending = Event.pending.order(:placement)
    @active = Event.active.order(:placement)
    @inactive = Event.inactive.order(:placement)
  end

  def show
    @event = Event.find(params[:id])
    @purchases = @event.purchases.order(:placement)
  end

  def new
    @event = Event.new
    @event.build_poster if @event.poster.nil?
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to admin_events_path
    else
      render :edit
    end
  end

  def placements
    params[:sortable].each_with_index do |id, index|
      Event.find(id).update_column(:placement, index + 1)
    end

    render json: true
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time, :description, :private, :location_name, :location_street, :location_city, :location_state, :location_zip, :published, :active, poster_attributes: [:id, :attachment])
  end

  def admin_navigation
    @navigation = "events"
  end
end
