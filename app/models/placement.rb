class Placement < ApplicationRecord
  has_many :deliveries

  # delegates :impressions
  # scope :sum_of_deliveries { select('sum(deliveries.impressions) as impression, placements.start, placements.end, placements.cpm, placements.name')
  # .group('placements.start, placements.end, placements.cpm, placements.name') }

  scope :sum_of_impression, -> {
                              joins(:deliveries).select('sum(deliveries.impressions) as impression, placements.id, placements.start, placements.end_date, placements.cpm, placements.name')
                                                .group('placements.start, placements.end_date, placements.cpm, placements.name, placements.id')
                                                .order('placements.id')
                                                .pluck(:name, :cpm, :start, :end_date, Arel.sql('sum(deliveries.impressions)'))
                            }

  def self.search(start_date, end_date)
    results = Placement.all
    total = { :total => 0, :number_of_impressions => 0 }
    results.each do |record|
      individual_cost = record.deliveries.where('date BETWEEN ? AND ?', start_date, end_date).sum(:impressions)
      total[:total] += (individual_cost) / 1000.0 * record.cpm
      total[:number_of_impressions] += individual_cost
    end
    total
  end
end
