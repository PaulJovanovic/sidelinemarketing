class HomeController < ApplicationController
  layout "home"

  def contact
    render layout: "application"
  end
end
