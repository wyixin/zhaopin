class AddColumnIntentionJobId < ActiveRecord::Migration
  def change
    add_column :resumes, :intention_job_id, :integer
  end
end
