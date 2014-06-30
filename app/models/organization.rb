class Organization < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true
  validates :name, uniqueness: true

  before_create :save_placement

  private

  def save_placement
    position = if last_organization = Organization.order(:placement).last
      last_organization.placement
    else
      0
    end
    self.placement = position + 1
  end
end
