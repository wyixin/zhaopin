class Position < ActiveRecord::Base
  has_many :sub_positions
  has_many :intention_jobs
end
