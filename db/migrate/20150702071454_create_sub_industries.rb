class CreateSubIndustries < ActiveRecord::Migration
  def change
    create_table :sub_industries do |t|
      t.integer :industry_id
      t.string :name

      t.timestamps null: false
    end
  end
end
