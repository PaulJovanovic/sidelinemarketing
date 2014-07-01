class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
    end

    Page.create(name: "Contact")
    Page.create(name: "Home")
  end
end
