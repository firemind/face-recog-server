class AdminController < ApplicationController
  def dashboard
    @tracking_timeframe = 5
    @locations = Location.all
    @chart_data = @locations.map do |loc|
      {
        name: loc.name,
        data: (loc.tracked_images
          .where("created_at > ?", 10.hours.ago)
          .group_by_second(:created_at)
          .count)
      }
    end
  end
end
