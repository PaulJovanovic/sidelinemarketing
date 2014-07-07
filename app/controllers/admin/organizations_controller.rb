class Admin::OrganizationsController < AdminController
  before_action :admin_navigation

  def index
    @organizations = Organization.order(:placement)
  end

  def show
    @organization = Organization.find(params[:id])
    @teams = @organization.teams.order(:placement)
  end

  def new
    @organization = Organization.new(params[:organization])
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to admin_organizations_path
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(organization_params)
      redirect_to admin_organizations_path
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find(params[:id])

    @organization.destroy
    redirect_to admin_organizations_path
  end

  def placements
    params[:sortable].each_with_index do |id, index|
      Organization.find(id).update_column(:placement, index + 1)
    end

    render json: true
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def admin_navigation
    @navigation = "athletes"
  end

end
