class LabelsController < ApplicationController
  def index
    @labels = Tracking.select("distinct(label)").map(&:label)
  end
end
