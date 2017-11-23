class LabelsController < ApplicationController
  def index
    @labels = Tracking.select("distinct(label)").map(&:label).map{|l| [l, Tracking.where(label: l).count]}.sort_by(&:last).reverse.to_h
  end

  def ordered_recluster
    trackings = Tracking.order("created_at")
    recluster_on(trackings)
  end

  def random_recluster
    trackings = Tracking.order("rand()")
    recluster_on(trackings, shuffled: true)
  end

  private
  def recluster_on(trackings, shuffled: false)
    tc = TrackingClient.new
    tc.reset
    trackings.find_in_batches(batch_size: 500) do |batch|
      batch.shuffle! if shuffled
      embs= batch.map &:emb
      ids = batch.map &:id
      resp = tc.track_batch(ids, embs)
      resp.each_with_index do |l,i|
        t = batch[i]
        t.label = l
        puts l
        t.save!
      end
    end

    redirect_to labels_path
  end
end
