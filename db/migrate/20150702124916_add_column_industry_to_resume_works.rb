class AddColumnIndustryToResumeWorks < ActiveRecord::Migration
  def change
    add_column :resume_works, :industry, :string
  end
end
