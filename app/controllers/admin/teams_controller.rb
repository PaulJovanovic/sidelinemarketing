class Admin::TeamsController < AdminController
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

  end

  private

  def team_params
    params.require(:team).permit(:name, :organization_id)
  end
end
