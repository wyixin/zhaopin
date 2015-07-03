class AddColumnIndustryIdAndPositionIdAndCityIdToIntentionJobs < ActiveRecord::Migration
  def change
    add_column :intention_jobs, :industry_id, :integer
    add_column :intention_jobs, :position_id, :integer
    add_column :intention_jobs, :city_id, :integer
  end
end
