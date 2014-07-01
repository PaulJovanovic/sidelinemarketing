class Editable < ActiveRecord::Base
  belongs_to :page

  validates :text, :page, presence: true
end
