class Event < ActiveRecord::Base
  has_one :poster, :as => :assetable, :class_name => "Poster", :dependent => :destroy
  has_many :purchases, class_name: "EventPurchase"

  accepts_nested_attributes_for :poster

  validates :poster, :name, :date, :start_time, :end_time, :location_name, :location_street, :location_city, :location_state, :location_zip, presence: true

  def description_as_html
    description.gsub("\n", "<br/>")
  end
end
