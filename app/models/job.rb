class Job < ActiveRecord::Base

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male
  enumerize :recommend, in: [:y, :n], default: :n

  belongs_to :company
  belongs_to :category
end
