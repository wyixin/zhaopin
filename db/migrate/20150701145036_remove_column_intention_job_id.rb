class RemoveColumnIntentionJobId < ActiveRecord::Migration
  def change
    remove_column :resumes, :intention_job_id
  end
end
