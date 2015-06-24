class ChangeStartTimeEndTimeFromResumeWork < ActiveRecord::Migration
  def up
    change_column :resume_works, :start_time, :date
    change_column :resume_works, :end_time, :date
  end

  def down
    change_column :resume_works, :start_time, :string
    change_column :resume_works, :end_time, :string
  end
end
