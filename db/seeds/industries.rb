#-*- coding: utf-8 -*-
puts "deleting Industry and SubIndustry ..."
Industry.delete_all
SubIndustry.delete_all
ActiveRecord::Base.connection.execute "ALTER TABLE industries AUTO_INCREMENT = 1"
ActiveRecord::Base.connection.execute "ALTER TABLE sub_industries AUTO_INCREMENT = 1"

puts "init Industry and SubIndustry ..."
industry = Industry.create(:name=>"计算机/互联网/通信")
SubIndustry.create(:name=>"计算机软件", :industry_id=>industry.id)
SubIndustry.create(:name=>"计算机硬件", :industry_id=>industry.id)
SubIndustry.create(:name=>"计算机服务", :industry_id=>industry.id)
SubIndustry.create(:name=>"通信/电信/网络设备", :industry_id=>industry.id)
SubIndustry.create(:name=>"通信/电信运营，增值服务", :industry_id=>industry.id)
SubIndustry.create(:name=>"互联网/电子商务", :industry_id=>industry.id)
SubIndustry.create(:name=>"网络游戏", :industry_id=>industry.id)
SubIndustry.create(:name=>"电子技术/半导体", :industry_id=>industry.id)
SubIndustry.create(:name=>"仪器仪表/工业自动化", :industry_id=>industry.id)

industry = Industry.create(:name=>"会计/金融/银行")
SubIndustry.create(:name=>"会计/审计", :industry_id=>industry.id)
SubIndustry.create(:name=>"金融/投资/证券", :industry_id=>industry.id)
SubIndustry.create(:name=>"银行", :industry_id=>industry.id)
SubIndustry.create(:name=>"保险", :industry_id=>industry.id)

industry = Industry.create(:name=>"贸易/消费/制造")
SubIndustry.create(:name=>"贸易/进出口", :industry_id=>industry.id)
SubIndustry.create(:name=>"批发/零售", :industry_id=>industry.id)
SubIndustry.create(:name=>"快速消费品", :industry_id=>industry.id)
SubIndustry.create(:name=>"服装/纺织/皮革", :industry_id=>industry.id)
SubIndustry.create(:name=>"家具/家电", :industry_id=>industry.id)
SubIndustry.create(:name=>"工艺礼品", :industry_id=>industry.id)
SubIndustry.create(:name=>"五金机电", :industry_id=>industry.id)
SubIndustry.create(:name=>"饰品", :industry_id=>industry.id)
SubIndustry.create(:name=>"玩具", :industry_id=>industry.id)
SubIndustry.create(:name=>"办公用品及设备", :industry_id=>industry.id)
SubIndustry.create(:name=>"机械/设备/重工", :industry_id=>industry.id)
SubIndustry.create(:name=>"汽车及零配件", :industry_id=>industry.id)

industry = Industry.create(:name=>"制药/医疗")
SubIndustry.create(:name=>"制药/生物工程", :industry_id=>industry.id)
SubIndustry.create(:name=>"医疗/护理/保健", :industry_id=>industry.id)
SubIndustry.create(:name=>"医疗设备/器械", :industry_id=>industry.id)

industry = Industry.create(:name=>"广告/媒体")
SubIndustry.create(:name=>"广告/美术/策划", :industry_id=>industry.id)
SubIndustry.create(:name=>"公关/市场推广", :industry_id=>industry.id)
SubIndustry.create(:name=>"影视/媒体/艺术", :industry_id=>industry.id)
SubIndustry.create(:name=>"文字媒体/出版", :industry_id=>industry.id)
SubIndustry.create(:name=>"印刷/包装/造纸", :industry_id=>industry.id)

industry = Industry.create(:name=>"房地产/建筑")
SubIndustry.create(:name=>"房地产开发", :industry_id=>industry.id)
SubIndustry.create(:name=>"建筑与工程", :industry_id=>industry.id)
SubIndustry.create(:name=>"家居/室内设计/装修", :industry_id=>industry.id)
SubIndustry.create(:name=>"物业管理/商业中心", :industry_id=>industry.id)

industry = Industry.create(:name=>"专业服务/教育/培训")
SubIndustry.create(:name=>"中介服务", :industry_id=>industry.id)
SubIndustry.create(:name=>"专业服务(咨询，人事)", :industry_id=>industry.id)
SubIndustry.create(:name=>"检测，认证", :industry_id=>industry.id)
SubIndustry.create(:name=>"法律", :industry_id=>industry.id)
SubIndustry.create(:name=>"教育培训", :industry_id=>industry.id)
SubIndustry.create(:name=>"学术科研", :industry_id=>industry.id)

industry = Industry.create(:name=>"服务业")
SubIndustry.create(:name=>"餐饮业", :industry_id=>industry.id)
SubIndustry.create(:name=>"酒店/旅游", :industry_id=>industry.id)
SubIndustry.create(:name=>"娱乐/休闲/体育", :industry_id=>industry.id)
SubIndustry.create(:name=>"美容/保健", :industry_id=>industry.id)
SubIndustry.create(:name=>"生活服务", :industry_id=>industry.id)

industry = Industry.create(:name=>"运输/物流")
SubIndustry.create(:name=>"交通/运输/物流", :industry_id=>industry.id)
SubIndustry.create(:name=>"航天/航空", :industry_id=>industry.id)

industry = Industry.create(:name=>"能源/原材料")
SubIndustry.create(:name=>"石油/化工/矿产", :industry_id=>industry.id)
SubIndustry.create(:name=>"采掘业/冶炼", :industry_id=>industry.id)
SubIndustry.create(:name=>"电力/水利", :industry_id=>industry.id)
SubIndustry.create(:name=>"原材料和加工", :industry_id=>industry.id)

industry = Industry.create(:name=>"政府/非赢利机构")
SubIndustry.create(:name=>"政府", :industry_id=>industry.id)
SubIndustry.create(:name=>"非赢利机构", :industry_id=>industry.id)
SubIndustry.create(:name=>"环保", :industry_id=>industry.id)
SubIndustry.create(:name=>"农业/渔业/林业", :industry_id=>industry.id)
SubIndustry.create(:name=>"多元化业务集团公司", :industry_id=>industry.id)

industry = Industry.create(:name=>"其它行业")
SubIndustry.create(:name=>"其它行业", :industry_id=>industry.id)



























