class TrackingsController < ApplicationController
  def index
    @trackings = Tracking.order("created_at desc").first(50)
  end

  def last
    @tracking = Tracking.order("created_at desc").first
  end
end
