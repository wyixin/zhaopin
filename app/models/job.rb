class Job < ActiveRecord::Base

  extend Enumerize
  enumerize :sex, in: [:male, :female], default: :male
  enumerize :recommend, in: [:y, :n], default: :n

  #validates
  validates_presence_of :name

  belongs_to :company
  belongs_to :position
  belongs_to :sub_position


  def duty_to_arr
    if self.duty.present?
      self.duty.split(',')
    end
  end

  def requirement_to_arr
    if self.requirement.present?
      self.requirement.split(',')
    end
  end
end
