class HistoriesController < ApplicationController
  def show
    @trackings = Tracking.where(label: @label=params[:id]).order("created_at desc")
  end
end
