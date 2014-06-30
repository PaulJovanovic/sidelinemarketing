class CreateEventPurchases < ActiveRecord::Migration
  def change
    create_table :event_purchases do |t|
      t.integer :event_id
      t.string :name
      t.string :description
    end
  end
end
