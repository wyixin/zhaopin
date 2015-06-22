class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :address
      t.string :website
      t.string :logo

      t.timestamps null: false
    end
  end
end
