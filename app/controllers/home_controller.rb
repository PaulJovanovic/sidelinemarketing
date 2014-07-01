class HomeController < ApplicationController
  layout "home"

  def index
    @editables = Page.where(name: "Home").last.editables
  end
end
