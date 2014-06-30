class Poster < Asset
  #541x665
  has_attached_file :attachment, :styles => { :small => ['', :png] }, :convert_options => { :small => '-resize "296x" +repage -crop "296x198+0+0" -gravity North' }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
