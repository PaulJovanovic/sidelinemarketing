class Photo < Asset
  has_attached_file :attachment, :styles => { :small => "148", :medium => "632" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
