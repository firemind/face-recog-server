class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def show
    @location = Location.find(params[:id])
  end
  def current
    @location = Location.find(params[:id])
    @tracking = @location.trackings.last
    @history  = Tracking.where(label: @tracking.label).where.not(id: @tracking.id).last(10)
  end

end
