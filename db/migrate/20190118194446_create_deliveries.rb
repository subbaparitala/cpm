class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :placement_id, null: false
      t.date :date, null: false
      t.integer :impressions, null: false

      t.timestamps
    end
  end
end
