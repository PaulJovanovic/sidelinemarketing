class EventsController < ApplicationController
  def index
    @events = Event.active.order(:placement)
  end

  def show
    @event = Event.find(params[:id])
  end
end
