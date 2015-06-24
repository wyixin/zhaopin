class ChangeStartTimeEndTimeFromResumeEducation < ActiveRecord::Migration
  def up
    change_column :resume_educations, :start_time, :date
    change_column :resume_educations, :end_time, :date
  end

  def down
    change_column :resume_educations, :start_time, :string
    change_column :resume_educations, :end_time, :string
  end

end
