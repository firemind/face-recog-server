class LabelsController < ApplicationController
  def index
    @labels = Tracking.select("distinct(label)").map(&:label).map{|l| [l, Tracking.where(label: l).count]}.sort_by(&:last).reverse.to_h
  end
  def random_recluster
    tc = TrackingClient.new
    tc.reset
    trackings = Tracking.order("rand()")
    trackings.each do |t|
      emb = t.emb
      resp = tc.track(t.id, emb)
      t.label = resp
      t.save!
    end

    redirect_to labels_path
  end
end
