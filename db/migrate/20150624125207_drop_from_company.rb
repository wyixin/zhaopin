class DropFromCompany < ActiveRecord::Migration
  ActiveRecord::Migration.drop_table(:companies)
end
