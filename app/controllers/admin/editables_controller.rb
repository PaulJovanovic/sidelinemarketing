class Admin::EditablesController < AdminController
  before_action :admin_navigation

  def edit
    @page = Page.find(params[:page_id])
    @editable = Editable.find(params[:id])
  end

  def update
    @page = Page.find(params[:page_id])
    @editable = Editable.find(params[:id])

    if @editable.update_attributes(editable_params)
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  private

  def editable_params
    params.require(:editable).permit(:text)
  end

  def admin_navigation
    @navigation = "pages"
  end
end
