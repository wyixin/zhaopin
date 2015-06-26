class AddColumnTemptationAndDutyAndRequirementToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :temptation, :string
    add_column :jobs, :duty, :text
    add_column :jobs, :requirement, :text
  end
end
