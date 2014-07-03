class AddPublishedAndActiveToEvents < ActiveRecord::Migration
  def change
    add_column :events, :published, :boolean, default: false
    add_column :events, :active, :boolean, default: false
  end
end
