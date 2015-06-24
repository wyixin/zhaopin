class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :phone
      t.string :email
      t.string :web_site
      t.string :logo
      t.string :logo_audit
      t.string :contents

      t.timestamps null: false
    end
  end
end
