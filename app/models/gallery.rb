class Gallery < ActiveRecord::Base
  has_many :photos, :as => :assetable, :class_name => "Photo", :dependent => :destroy
end
