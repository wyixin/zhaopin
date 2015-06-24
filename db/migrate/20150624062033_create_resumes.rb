class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :status
      t.integer :user_id
      t.string :title
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :sex
      t.date :birthday
      t.string :height
      t.string :marriage
      t.string :tag
      t.string :qq
      t.string :intention_jobs
      t.string :wage
      t.string :district
      t.string :photo_img
      t.string :photo_audit
      t.string :talent
      t.string :complete_percent
      t.integer :click
      t.string :tpl

      t.timestamps null: false
    end
  end
end
