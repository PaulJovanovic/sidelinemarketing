class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @editables = Page.where(name: "Contact").last.editables
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      redirect_to contact_success_path
    else
      flash[:notice] = "Failed to send message."
      render :new
    end
  end
end
