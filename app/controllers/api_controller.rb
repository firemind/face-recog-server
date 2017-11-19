require 'fileutils'
class ApiController < ApplicationController
  include LabelsHelper

  def track
    if params[:image]
      meta = JSON.parse(params[:data])
      location = Location.where(name: meta["location"]).first_or_create!
      tracked_image = TrackedImage.create(
          location: location,
          image: params[:image]
      )
      tracked_image.save!
      embs = meta['embeddings']
      unless embs
        puts "No Embedding sent"
        ec = EmbeddingClient.new
        embs = [ec.embed(params[:image])]
      end
      trackings = []
      meta['positions'].each_with_index do |pos, ix|
        puts pos.inspect
        Tracking.transaction do
          tracking = Tracking.create(
              tracked_image: tracked_image,
              width:  pos['width'],
              height: pos['height'],
              left:   pos['left'],
              top:    pos['top']
          )
          tc = TrackingClient.new
          label = tc.track(tracking.id, embs[ix])
          tracking.label = label
          puts tracking.inspect
          tracking.save!
          trackings << tracking
        end
      end
      render json: {
          label: trackings.map(&:label),
          location_url: current_location_url(id: location.name),
          colors: trackings.map(&:label).map{|l| label_color(l)[1..6]},
      }
    else
      render error: "No image given"
    end
  end

end
