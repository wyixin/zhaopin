#-*- coding: utf-8 -*-
puts "deleting City and Area ..."
City.delete_all
Area.delete_all
ActiveRecord::Base.connection.execute "ALTER TABLE cities AUTO_INCREMENT = 1"
ActiveRecord::Base.connection.execute "ALTER TABLE areas AUTO_INCREMENT = 1"

puts "init City and Area ..."
city = City.create(:name=>"义乌")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"稠城", :city_id=>city.id)
Area.create(:name=>"稠江", :city_id=>city.id)
Area.create(:name=>"城西", :city_id=>city.id)
Area.create(:name=>"江东", :city_id=>city.id)
Area.create(:name=>"北苑", :city_id=>city.id)
Area.create(:name=>"荷叶塘", :city_id=>city.id)
Area.create(:name=>"苏溪", :city_id=>city.id)
Area.create(:name=>"大陈", :city_id=>city.id)
Area.create(:name=>"廿三里", :city_id=>city.id)
Area.create(:name=>"后宅", :city_id=>city.id)
Area.create(:name=>"佛堂", :city_id=>city.id)
Area.create(:name=>"义亭", :city_id=>city.id)
Area.create(:name=>"上溪", :city_id=>city.id)
Area.create(:name=>"赤岸", :city_id=>city.id)

city = City.create(:name=>"慈溪")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"浒山", :city_id=>city.id)
Area.create(:name=>"白沙路", :city_id=>city.id)
Area.create(:name=>"宗汉街", :city_id=>city.id)
Area.create(:name=>"坎墩街", :city_id=>city.id)
Area.create(:name=>"古塘街", :city_id=>city.id)
Area.create(:name=>"横河镇", :city_id=>city.id)
Area.create(:name=>"匡堰镇", :city_id=>city.id)
Area.create(:name=>"崇寿镇", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)


  city = City.create(:name=>"余姚")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"凤山街", :city_id=>city.id)
Area.create(:name=>"阳明街", :city_id=>city.id)
Area.create(:name=>"梨洲街", :city_id=>city.id)
Area.create(:name=>"兰江街", :city_id=>city.id)
Area.create(:name=>"朗霞街", :city_id=>city.id)
Area.create(:name=>"低塘街", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)

city = City.create(:name=>"金华")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"婺城区", :city_id=>city.id)
Area.create(:name=>"金东区", :city_id=>city.id)
Area.create(:name=>"兰溪市", :city_id=>city.id)
Area.create(:name=>"义乌市", :city_id=>city.id)
Area.create(:name=>"东阳市", :city_id=>city.id)
Area.create(:name=>"永康市", :city_id=>city.id)
Area.create(:name=>"浦江县", :city_id=>city.id)
Area.create(:name=>"武义县", :city_id=>city.id)
Area.create(:name=>"磐安县", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)


city = City.create(:name=>"永康")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"石柱", :city_id=>city.id)
Area.create(:name=>"前仓", :city_id=>city.id)
Area.create(:name=>"舟山", :city_id=>city.id)
Area.create(:name=>"古山", :city_id=>city.id)
Area.create(:name=>"方岩", :city_id=>city.id)
Area.create(:name=>"龙山", :city_id=>city.id)
Area.create(:name=>"西溪", :city_id=>city.id)
Area.create(:name=>"象珠", :city_id=>city.id)
Area.create(:name=>"唐先", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)


city = City.create(:name=>"东阳")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"吴宁街", :city_id=>city.id)
Area.create(:name=>"南市街", :city_id=>city.id)
Area.create(:name=>"白云街", :city_id=>city.id)
Area.create(:name=>"江北街", :city_id=>city.id)
Area.create(:name=>"城东街", :city_id=>city.id)
Area.create(:name=>"六石街", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)

city = City.create(:name=>"浦江")
Area.create(:name=>"不限", :city_id=>city.id)
Area.create(:name=>"浦阳街", :city_id=>city.id)
Area.create(:name=>"浦南街", :city_id=>city.id)
Area.create(:name=>"仙华街", :city_id=>city.id)
Area.create(:name=>"其它", :city_id=>city.id)

city = City.create(:name=>"周边")
Area.create(:name=>"不限", :city_id=>city.id)




















