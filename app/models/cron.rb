# frozen_string_literal: true

class Cron
  def self.publish_all_approved_ads
    ads = Ad.approved
    ads.each(&:publish)
  end

  def self.ads_to_archive
    ads = Ad.published
    ads.each do |ad|
      ad.to_archive if ad.updated_at.to_date < Time.now.to_date - 3.days
    end
  end
end
