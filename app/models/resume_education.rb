class ResumeEducation < ActiveRecord::Base

  #enumes
  extend Enumerize
  enumerize :education, in: [:primary, :middle, :high, :junior_college, :university, :dr, :master], default: :junior_college

  belongs_to :user

end
