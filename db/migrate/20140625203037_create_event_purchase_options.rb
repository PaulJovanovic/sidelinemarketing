class CreateEventPurchaseOptions < ActiveRecord::Migration
  def change
    create_table :event_purchase_options do |t|
      t.integer :event_purchase_id
      t.integer :quantity
      t.integer :price_in_cents
    end
  end
end
