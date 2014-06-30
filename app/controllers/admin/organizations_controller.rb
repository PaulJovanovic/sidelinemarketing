class Admin::OrganizationsController < AdminController
  before_action :admin_navigation

  def index
    @organizations = Organization.all
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

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def admin_navigation
    @navigation = "athletes"
  end

end
