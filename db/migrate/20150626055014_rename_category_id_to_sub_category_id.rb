class RenameCategoryIdToSubCategoryId < ActiveRecord::Migration
  def change
    rename_column :articles, :category_id ,:sub_category_id
  end
end
