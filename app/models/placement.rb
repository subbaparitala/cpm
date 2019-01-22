class Placement < ApplicationRecord
  has_many :deliveries

  # delegates :impressions
  # scope :sum_of_deliveries { select('sum(deliveries.impressions) as impression, placements.start, placements.end, placements.cpm, placements.name')
    # .group('placements.start, placements.end, placements.cpm, placements.name') }

   scope :sum_of_impression, -> { 
   joins(:deliveries).select('sum(deliveries.impressions) as impression, placements.id, placements.start, placements.end, placements.cpm, placements.name')
   .group('placements.start, placements.end, placements.cpm, placements.name, placements.id')
   .order('placements.id')
   .pluck(:name, :cpm, :start, :end, Arel.sql('sum(deliveries.impressions)'))
 } 
end
 
