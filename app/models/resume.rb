class Resume < ActiveRecord::Base

  #enumes
  extend Enumerize
  enumerize :status, in: [:normal, :not_audit , :not_display], default: :normal
  enumerize :sex, in: [:male, :female], default: :male
  enumerize :educational, in: [:primary, :middle, :high, :junior_college, :university, :dr, :master], default: :junior_college
  enumerize :marriage, in: [:y, :n], default: :n
  enumerize :political_status, in: [:party_member, :members, :masses], default: :members
  enumerize :driving_license, in: [:y, :n], default: :n


  #validates
  validates_presence_of :user_id
  validates_uniqueness_of :user_id

  #relations
  belongs_to :user
  has_many :resume_attachments
  has_many :resume_works
  has_many :trainings
  belongs_to :intention_job

  def self.districts
    [
        "浙江省","北京市","天津市","河北省","山西省","内蒙古","辽宁省","吉林省","黑龙江省","上海市"," 江苏省","安徽省",
        "福建省","江西省","山东省","河南省","湖北省","湖南省","广东省","广西自治区","海南省","重庆市","四川省","贵州省",
        "云南省","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区","维吾尔自治区","香港特别行政区","澳门特别行政区",
        "台湾省","其它"
    ]
  end
end
