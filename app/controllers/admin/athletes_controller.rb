class Admin::AthletesController < AdminController
  before_action :admin_navigation

  def new
    @organization = Organization.find(params[:organization_id])
    @team = Team.find(params[:team_id])
    @athlete = Athlete.new(params[:athlete])
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.team_id = params[:team_id]

    if @athlete.save
      redirect_to admin_organization_team_path(@athlete.team.organization, @athlete.team)
    else
      @organization = Organization.find(params[:organization_id])
      @team = Team.find(params[:team_id])
      render :new
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
    @team = @athlete.team
    @organization = @team.organization
  end

  def update
    @athlete = Athlete.find(params[:id])

    if @athlete.update_attributes(athlete_params)
      redirect_to admin_organization_team_path(@athlete.team.organization, @athlete.team)
    else
      @organization = Organization.find(params[:organization_id])
      @team = Team.find(params[:team_id])
      render :edit
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @team = Team.find(params[:team_id])

    @athlete.destroy
    redirect_to admin_organization_team_path(@team.organization, @team)
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name)
  end

  def admin_navigation
    @navigation = "athletes"
  end
end
