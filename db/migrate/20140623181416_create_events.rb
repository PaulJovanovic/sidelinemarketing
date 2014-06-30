class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location_name
      t.string :location_street
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.datetime :date
      t.string :start_time
      t.string :end_time
      t.datetime :active_at
      t.datetime :expires_at
      t.boolean :private, default: false
      t.timestamps
    end
  end
end
