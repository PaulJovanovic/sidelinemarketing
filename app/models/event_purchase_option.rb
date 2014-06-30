class EventPurchaseOption < ActiveRecord::Base
  belongs_to :event_purchase

  monetize :price_cents
end
