class Classification < ActiveRecord::Base
  acts_as_audited

  belongs_to :classification_heading

  validates :classification_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

end
