class HistoriesController < ApplicationController
  def show
    @trackings = Tracking.where(label: @label=params[:id])
  end
end
