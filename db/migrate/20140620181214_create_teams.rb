class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :organization_id
      t.string :name
      t.integer :placement
      t.timestamps
    end
  end
end
