class Photo < Asset
  has_attached_file :attachment, :styles => { :small => "148x99#", :medium => "632x422#" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
