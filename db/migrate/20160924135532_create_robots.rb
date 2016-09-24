class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :horizontal
      t.integer :vertical
      t.string :facing

      t.timestamps null: false
    end
  end
end
