class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.string :name, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.integer :cpm, null: false

      t.timestamps
    end
  end
end
