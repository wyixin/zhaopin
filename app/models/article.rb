class Article < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :sub_category_id

  belongs_to :sub_category
end
