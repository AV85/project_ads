class Cron
  def self.publish_all_approved_ads
    ads = Ad.approved
    ads.each do |ad|
      ad.publish
    end
  end
end