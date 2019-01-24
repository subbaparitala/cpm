class RenamePlacementEndToEndDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :placements, :end, :end_date
  end
end
