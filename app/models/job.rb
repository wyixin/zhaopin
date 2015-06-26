class Job < ActiveRecord::Base

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male
  enumerize :recommend, in: [:y, :n], default: :n

  #validates
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :company
  belongs_to :category
  belongs_to :sub_category
end
