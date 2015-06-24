class Resume < ActiveRecord::Base

  #enumes
  extend Enumerize
  enumerize :status, in: [:normal, :not_audit , :not_display], default: :normal
  enumerize :sex, in: [:male, :female], default: :male
  #enumerize :marriage, in: [:y, :n], default: :n

  #validates
  validates_presence_of :user_id
  validates_uniqueness_of :user_id

  #relations
  belongs_to :user
  has_many :resume_attachment
  has_many :resume_work



end
