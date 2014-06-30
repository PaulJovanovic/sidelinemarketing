class Address < ActiveRecord::Base
  belongs_to :order

  validates :first_name, :last_name, :address_1, :city, :state, :zip, presence: true

  def country
    "USA"
  end
end
