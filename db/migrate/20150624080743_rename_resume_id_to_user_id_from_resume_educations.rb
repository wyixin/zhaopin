class RenameResumeIdToUserIdFromResumeEducations < ActiveRecord::Migration
  def change
    rename_column :resume_educations, :resume_id ,:user_id
  end
end
