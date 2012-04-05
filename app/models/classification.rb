class Classification < ActiveRecord::Base
  attr_accessible :id,:classification_heading_id,:classification_name, :created_at,:updated_at
  acts_as_audited

  belongs_to :classification_heading

  validates :classification_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

end
