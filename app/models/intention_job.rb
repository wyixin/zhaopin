class IntentionJob < ActiveRecord::Base

  extend Enumerize
  enumerize :intention_status, in: [:wanted, :leave, :job], default: :wanted
  enumerize :is_discuss, in: [:y, :n], default: :n
  enumerize :is_secrecy, in: [:y, :n], default: :n

  belongs_to :sub_industry
  belongs_to :sub_position
  belongs_to :area


  validates_presence_of :sub_industry_id
  validates_presence_of :sub_position_id
  validates_presence_of :area_id
end
