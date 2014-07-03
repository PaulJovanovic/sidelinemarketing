class AddPlacementToEventPurchases < ActiveRecord::Migration
  def change
    add_column :event_purchases, :placement, :integer
  end
end
