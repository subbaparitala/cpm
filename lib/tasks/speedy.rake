require 'csv'
namespace :speedy do
  desc "This will import delivery csv file to delivery table"
  task import_delivery: :environment do
    first_time = true
    CSV.foreach("#{Rails.root}/tmp/delivery.csv") do |row|
      if first_time
        first_time = false
        next
      end
      delivery = Delivery.new(placement_id: row[0], date: Date.strptime(row[1], '%m/%d/%Y'), impressions: row[2])
      delivery.save!
    end
  end

  desc "This will import placement csv file to placement table "
  task import_placement: :environment do
    first_time = true
    CSV.foreach("#{Rails.root}/tmp/placements.csv") do |row|
      if first_time
        first_time = false
        next
     end
      # print row[0], row[1], row[2].class, row[3]
      placement = Placement.new(id: row[0], name: row[1], start: Date.strptime(row[2], '%m/%d/%y'), end: Date.strptime(row[3], '%m/%d/%y'), cpm: row[4])
      placement.save!
    end
  end
end
