class JobsController < ApplicationController
  def index
    @categories = Category.all
    @hot_sub_categories = SubCategory.where(:category_id=>6)
  end
end
