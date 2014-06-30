class CreateEventPurchaseOptionsOrders < ActiveRecord::Migration
  def change
    create_table :event_purchase_options_orders do |t|
      t.integer :event_purchase_option_id
      t.integer :order_id
    end
  end
end
