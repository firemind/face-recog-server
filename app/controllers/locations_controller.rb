class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def show
    unless @location = Location.where(name: params[:id]).first
      @location = Location.find(params[:id])
    end
  end
  def current
    @loc_name = params[:id]
    if @location = Location.where(name: @loc_name).first
      @tracking = @location.trackings.last
      @history  = Tracking.where(label: @tracking.label).where.not(id: @tracking.id).includes(:tracked_image, :location).order("created_at desc").first(9)
    end
  end

end
