class CreateResumeEducations < ActiveRecord::Migration
  def change
    create_table :resume_educations do |t|
      t.integer :resume_id
      t.string :school
      t.string :speciality
      t.string :education
      t.string :start_time
      t.string :end_time

      t.timestamps null: false
    end
  end
end
