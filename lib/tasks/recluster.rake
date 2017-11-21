task recluster: :environment do
  tc = TrackingClient.new
  tc.reset
  trackings = Tracking.all.shuffle
  trackings.each do |t|
    emb = t.emb
    resp = tc.track(t.id, emb)
    puts resp
    t.label = resp 
    t.save!
  end

end
