puts "delete Training ..."
Training.delete_all
ActiveRecord::Base.connection.execute "ALTER TABLE trainings AUTO_INCREMENT = 1"


puts "init Training ..."
Resume.all.each do |resume|
  Training.create(resume_id:resume.id)
end