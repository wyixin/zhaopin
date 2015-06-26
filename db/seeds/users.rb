#-*- coding: utf-8 -*-
puts "deleting Account ..."
#User.delete_all
#ActiveRecord::Base.connection.execute "ALTER TABLE sys_accounts AUTO_INCREMENT = 1"

puts "Creating admin user as admin/11111111 ..."
User.create(email: 'admin@123.com',
               password: '11111111',
               password_confirmation: '11111111',
               role: :admin)