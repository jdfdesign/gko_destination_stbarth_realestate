# This migration comes from gko_realty_engine (originally 20140304135600)
class CreateCitiesTable < ActiveRecord::Migration
   def up
     create_table :cities, :force => true do |t| 
       t.string :name, :limit => 80
       t.references :site
       t.timestamps
     end
     
     add_column :areas, :city_id, :integer unless column_exists?(:areas, :city_id)
     add_index :areas, :city_id unless index_exists?(:areas, :city_id)
     
     remove_column :areas, :site_id if column_exists?(:areas, :site_id)
     remove_index :areas, :site_id if index_exists?(:areas, :site_id)
     
     if Site.count == 1
       @site = Site.first
       
       @city = City.create(:name => "Saint-Barthelemy", :site_id => @site.id)
       
       Area.all.each do |area|
         area.update_attribute(:city_id, @city.id)
       end
     end
     
   end
   
   def down
     drop_table :cities
     remove_column :areas, :city_id
     remove_index :areas, :city_id
     add_column :areas, :site_id, :integer
     add_index :areas, :site_id
     
     if Site.count == 1
       @site = Site.first
       Area.all.each do |area|
         area.update_attribute(:site_id, @site.id)
       end
     end
   end
end