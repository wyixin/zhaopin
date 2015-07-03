class RenameCategoryIdToPositionIdFromJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :category_id ,:position_id
  end
end
