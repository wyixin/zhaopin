class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :company_id
      t.string :recommend
      t.string :sex
      t.string :amount
      t.integer :category_id
      t.integer :sub_category_id
      t.string :education
      t.string :experience
      t.string :wage
      t.date :strat_time
      t.date :end_time

      t.timestamps null: false
    end
  end
end
