class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Enumerize
  enumerize :role, in: [:user, :customer , :admin], default: :user
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  def init_resume
    resume = Resume.new(:user_id=>self.id)
    resume.save

    intention_job = IntentionJob.new()

    resume_work = ResumeWork.new(:resume_id=>resume.id)
    resume_work.save

    resume_education = ResumeEducation.new(:user_id=>self.id)
    resume_education.save
  end

end
