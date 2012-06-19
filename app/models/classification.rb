class Classification < ActiveRecord::Base
  attr_accessible :classification_heading_id,:classification_name
  acts_as_audited

  belongs_to :classification_heading, :validate => true

  validates :classification_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

end
