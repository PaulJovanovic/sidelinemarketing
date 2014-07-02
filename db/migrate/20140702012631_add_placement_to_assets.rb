class AddPlacementToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :placement, :integer
  end
end
