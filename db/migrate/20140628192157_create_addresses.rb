class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :order_id
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
    end
  end
end
