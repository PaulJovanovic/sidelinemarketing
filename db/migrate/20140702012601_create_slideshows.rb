class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :name
    end

    Slideshow.create(name: "Athletes")
  end
end
