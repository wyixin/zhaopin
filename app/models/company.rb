class Company < ActiveRecord::Base

  has_many :jobs

  #validates
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :phone
  validates_uniqueness_of :phone
  validates_presence_of :email
  validates_uniqueness_of :email



end
