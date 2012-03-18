class RealtySetSiteOnArea < ActiveRecord::Migration
  def up
    if Site.count == 1
      @site = Site.first
      Area.all.each do |area|
        area.update_attribute(:site_id, @site.id)
      end
    end
  end
  
  def down
    
  end
end
