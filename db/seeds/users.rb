#-*- coding: utf-8 -*-
puts "deleting Account ..."
User.delete_all
#ActiveRecord::Base.connection.execute "ALTER TABLE sys_accounts AUTO_INCREMENT = 1"

puts "Creating admin user as admin@123.com/11111111 ..."
User.create(email: 'admin@123.com',
            password: '11111111',
            password_confirmation: '11111111',
            role: :admin)

puts "Creating user as user@123.com/11111111 ..."
u = User.create(email: 'user@123.com',
            password: '11111111',
            password_confirmation: '11111111',
            role: :user)
u.init_resume

puts "Creating customer user as cust@123.com/11111111 ..."
User.create(email: 'cust@123.com',
            password: '11111111',
            password_confirmation: '11111111',
            role: :customer)
