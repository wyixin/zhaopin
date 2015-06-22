class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :company_id
      t.string :price
      t.string :address

      t.timestamps null: false
    end
  end
end
