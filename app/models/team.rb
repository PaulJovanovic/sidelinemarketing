class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :athletes, dependent: :destroy

  validates :organization_id, presence: true

  before_create :save_placement

  private

  def save_placement
    position = if last_team = Team.where(organization_id: organization_id).order(:placement).last
      last_team.placement
    else
      0
    end
    self.placement = position + 1
  end
end
