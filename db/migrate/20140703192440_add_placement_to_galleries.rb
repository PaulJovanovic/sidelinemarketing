class AddPlacementToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :placement, :integer
  end
end
