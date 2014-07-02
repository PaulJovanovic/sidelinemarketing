class Slideshow < ActiveRecord::Base
  has_many :slides, :as => :assetable, :class_name => "Slide", :dependent => :destroy
end
