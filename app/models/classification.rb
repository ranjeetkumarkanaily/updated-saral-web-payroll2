class Classification < ActiveRecord::Base

  belongs_to :classification_heading

  validates :classification_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

end
