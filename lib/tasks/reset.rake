task reset: :environment do
  ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK'] = "1"
  t = Rake::Task["db:reset"]
  t.reenable
  t.invoke
  FileUtils.rm_r(File.join(Rails.root, "public/system"))
  TrackingClient.new.reset
end
