class AddPlacementToEvents < ActiveRecord::Migration
  def change
    add_column :events, :placement, :integer
  end
end
