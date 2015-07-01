class AddColumnRewardToResumeEducations < ActiveRecord::Migration
  def change
    add_column :resume_educations, :reward, :string
    add_column :resume_educations, :school_experience, :string
    add_column :resume_educations, :computer_ability, :string
    add_column :resume_educations, :foreign_language1, :string
    add_column :resume_educations, :foreign_language1_ls, :string
    add_column :resume_educations, :foreign_language1_rw, :string
    add_column :resume_educations, :foreign_language2, :string
    add_column :resume_educations, :foreign_language2_ls, :string
    add_column :resume_educations, :foreign_language2_rw, :string
    add_column :resume_educations, :mandarin, :string
    add_column :resume_educations, :other_skills, :string
  end
end
