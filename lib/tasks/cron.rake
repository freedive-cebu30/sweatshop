task :cron => :environment do
  require 'post_data'
  PostData.start
end