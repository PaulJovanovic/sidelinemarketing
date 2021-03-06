class Admin::TeamsController < AdminController
  before_action :admin_navigation

  def show
    @organization = Organization.find(params[:organization_id])
    @team = Team.find(params[:id])
    @athletes = @team.athletes.order(:name)
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @team = Team.new(params[:team])
  end

  def create
    @team = Team.new(team_params)
    @team.organization_id = params[:organization_id]

    if @team.save
      redirect_to admin_organization_path(@team.organization)
    else
      @organization = Organization.find(params[:organization_id])
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    @organization = @team.organization
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to admin_organization_path(@team.organization)
    else
      @organization = Organization.find(params[:organization_id])
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @organization = Organization.find(params[:organization_id])

    @team.destroy
    redirect_to admin_organization_path(@organization)
  end

  def placements
    params[:sortable].each_with_index do |id, index|
      Team.find(id).update_column(:placement, index + 1)
    end

    render json: true
  end

  private

  def team_params
    params.require(:team).permit(:name, :organization_id)
  end

  def admin_navigation
    @navigation = "athletes"
  end
end
