task kcluster: :environment do
  require 'kmeans-clusterer'
  trackings = Tracking.all

  k = 7 # find 2 clusters in data

  data = trackings.map{|t| t.emb}
  kmeans = KMeansClusterer.run k, data, labels: trackings.map(&:id), runs: 5
  kmeans.clusters.each do |cluster|
    cluster.points.each do |point|
      t = Tracking.find(point.label)
      puts  "#{t.label} -> #{cluster.id}"
      t.label = cluster.id
      t.save!
    end
  end

end
