#-*- coding: utf-8 -*-
puts "deleting Category ..."
Category.delete_all
ActiveRecord::Base.connection.execute "ALTER TABLE categories AUTO_INCREMENT = 1"

puts "deleting SubCategory ..."
SubCategory.delete_all
ActiveRecord::Base.connection.execute "ALTER TABLE sub_categories AUTO_INCREMENT = 1"

puts "init Category ..."
category = Category.create(:name=>'技术')

puts "init SubCategory ..."
SubCategory.create(:category_id=>category.id, :name=>'Java')
SubCategory.create(:category_id=>category.id, :name=>'Php')
SubCategory.create(:category_id=>category.id, :name=>'.Net')
SubCategory.create(:category_id=>category.id, :name=>'C++')
SubCategory.create(:category_id=>category.id, :name=>'Android')

Category.create(:name=>'产品')
Category.create(:name=>'运营')
Category.create(:name=>'设计')
Category.create(:name=>'其它')

category = Category.create(:name=>'热门')
SubCategory.create(:category_id=>category.id, :name=>'电子商务')
SubCategory.create(:category_id=>category.id, :name=>'工程管理')
SubCategory.create(:category_id=>category.id, :name=>'人事')
SubCategory.create(:category_id=>category.id, :name=>'策划')