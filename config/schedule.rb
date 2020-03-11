env :PATH, ENV['PATH']

set :environment, "development"
set :output, {:standard => "log/cron_log.log", :error => "log/cron_error_log.log" }

every 1.day, at: '0:00 am' do
  runner "Cron.publish_all_approved_ads"
end

every 1.day, at: '11:50 am' do
  runner "Cron.ads_to_archive"
end
