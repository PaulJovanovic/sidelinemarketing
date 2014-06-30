class EventPurchase < ActiveRecord::Base
  belongs_to :event
  has_many :options, class_name: "EventPurchaseOption", dependent: :destroy

  accepts_nested_attributes_for :options

  validates :name, :description, :options, presence: true
end
