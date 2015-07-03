class SubPosition < ActiveRecord::Base

  belongs_to :position
  has_many :intention_jobs
end
