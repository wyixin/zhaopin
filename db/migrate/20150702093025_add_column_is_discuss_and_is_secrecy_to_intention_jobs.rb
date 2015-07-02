class AddColumnIsDiscussAndIsSecrecyToIntentionJobs < ActiveRecord::Migration
  def change
    add_column :intention_jobs, :is_discuss, :string, default: :n
    add_column :intention_jobs, :is_secrecy, :string, default: :n
  end
end
