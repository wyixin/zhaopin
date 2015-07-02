class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :resume_id
      t.string :name
      t.string :start_time
      t.string :end_time
      t.text :content

      t.timestamps null: false
    end
  end
end
