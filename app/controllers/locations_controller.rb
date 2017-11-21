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
      base_scope = Tracking.where(label: @tracking.label).
          where.not(id: @tracking.id).
          includes(:tracked_image, :location).
          order("trackings.created_at asc")
      num_images = 6
      @history  = base_scope.
          joins(:tracked_image).
          where.not(tracked_images: {location_id: @tracking.location.id}).
          first(num_images)
      count = @history.size
      if count < num_images
        @history += base_scope.first(num_images - count)
      end
    end
  end

end
