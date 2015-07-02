class AddColumnNumberAndQualityCaseAndRankingAndReasonsToResumeWorks < ActiveRecord::Migration
  def change
    add_column :resume_works, :number, :integer
    add_column :resume_works, :quality_case, :text
    add_column :resume_works, :ranking, :string
    add_column :resume_works, :reasons, :string
  end
end
