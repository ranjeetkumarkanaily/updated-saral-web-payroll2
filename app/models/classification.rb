class Classification < ActiveRecord::Base
  #attr_accessible :classification_heading_name, :display_order, :created_at,:updated_at
  acts_as_audited

  belongs_to :classification_heading

  validates :classification_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

end
