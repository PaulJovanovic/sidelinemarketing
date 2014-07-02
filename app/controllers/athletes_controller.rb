class AthletesController < ApplicationController
  def index
    @organizations = Organization.order(:placement)
    @slideshow = Slideshow.where(name: "Athletes").last
  end
end
