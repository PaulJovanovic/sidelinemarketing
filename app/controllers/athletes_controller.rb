class AthletesController < ApplicationController
  def index
    @organizations = Organization.order(:placement)
  end
end
