class CreateSubPositions < ActiveRecord::Migration
  def change
    create_table :sub_positions do |t|
      t.integer :position_id
      t.string :name

      t.timestamps null: false
    end
  end
end
