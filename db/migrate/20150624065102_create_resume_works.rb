class CreateResumeWorks < ActiveRecord::Migration
  def change
    create_table :resume_works do |t|
      t.integer :resume_id
      t.string :company
      t.string :job
      t.string :wage
      t.string :start_time
      t.string :end_time
      t.text :achievements

      t.timestamps null: false
    end
  end
end
