class RenameSubCategoryIdToSubPositionIdFromJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :sub_category_id ,:sub_position_id
  end
end
