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
    @history  = Tracking.where(label: @tracking.label).where.not(id: @tracking.id).includes(:tracked_image, :location).order("created_at desc").first(9)
  end

end
