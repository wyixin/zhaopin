class Job < ActiveRecord::Base

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male

  belongs_to :company
end
