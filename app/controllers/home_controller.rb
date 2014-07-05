class HomeController < ApplicationController
  layout "home"

  def index
    @editables = Page.where(name: "Home").last.editables
    @slideshow = Slideshow.where(name: "Home").last
  end
end
