require 'fileutils'
class ApiController < ApplicationController

  def track
    if params[:image]
      meta = JSON.parse(params[:data])
      puts meta
      embs = meta['embeddings']
      unless embs
        puts "No Embedding sent"
        ec = EmbeddingClient.new
        embs = [ec.embed(params[:image])]
      end
      location = Location.where(name: meta["location"]).first_or_create!
      trackings = []
      meta['positions'].each_with_index do |pos, ix|
        puts pos.inspect
        Tracking.transaction do
          tracking = Tracking.create(
              location: location,
              image: params[:image],
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
          history_url: trackings.map{|t| history_url(t.label)},
          location_url: current_location_url(location),
      }
    else
      render error: "No image given"
    end
  end

end
