class PlacementsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def index
    @placements = Placement.sum_of_impression
  end

  def search
    @deliveries = Placement.search(params[:start_date], params[:end_date])
    @dates = Delivery.distinct.sort.pluck(:date)

    if @deliveries[:total]
      @total = "Total (#{params[:start_date]}-#{params[:end_date]}): #{number_with_delimiter(@deliveries[:number_of_impressions], :delimiter => ',')} impressions, $#{number_with_delimiter(@deliveries[:total].round, :delimiter => ',')}"
    end
  end
end
