class Slide < Asset
  has_attached_file :attachment, :styles => { :small => "242x125#", :medium => "968x500#" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
