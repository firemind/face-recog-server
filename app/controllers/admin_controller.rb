class AdminController < ApplicationController
  def dashboard
    @tracking_timeframe = 5
    @locations = Location.all
    @chart_data = @locations.map do |loc|
      {
        name: loc.name,
        data: (loc.trackings
          .where("created_at > ?", 10.hours.ago)
          .group_by_second(:created_at)
          .count)
      }
    end
  end
end
