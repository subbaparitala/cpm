class PlacementsController < ApplicationController

  def index
    @placements = Placement.sum_of_impression
  end
end
