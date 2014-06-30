class ChangePriceInCentsToMoney < ActiveRecord::Migration
  def change
    remove_column :event_purchase_options, :price_in_cents
    add_money :event_purchase_options, :price
  end
end
