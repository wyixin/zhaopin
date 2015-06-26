class AddColumnSourceAndClickToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :source, :string
    add_column :articles, :click, :integer
  end
end
