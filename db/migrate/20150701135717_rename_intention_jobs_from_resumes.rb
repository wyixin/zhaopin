class RenameIntentionJobsFromResumes < ActiveRecord::Migration
  def change
    rename_column :resumes, :intention_jobs ,:intention_job_id
  end
end
