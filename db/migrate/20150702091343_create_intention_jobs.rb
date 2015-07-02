class CreateIntentionJobs < ActiveRecord::Migration
  def change
    create_table :intention_jobs do |t|
      t.string :intention_status
      t.integer :sub_industry_id
      t.integer :sub_position_id
      t.integer :area_id
      t.string :hope_wage
      t.string :now_wage

      t.timestamps null: false
    end
  end
end
