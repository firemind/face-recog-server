class TrackedImagesController < ApplicationController

  def show
    @tracked_image = TrackedImage.find(params[:id])
  end
end
