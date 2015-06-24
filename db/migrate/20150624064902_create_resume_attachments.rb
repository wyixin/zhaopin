class CreateResumeAttachments < ActiveRecord::Migration
  def change
    create_table :resume_attachments do |t|
      t.integer :resume_id
      t.string :attachment_file

      t.timestamps null: false
    end
  end
end
