# This migration comes from gko_realty_engine (originally 20140304184900)
class AddCityToProperties < ActiveRecord::Migration
   def up
     add_column :rental_property_options, :city_id, :integer unless column_exists?(:rental_property_options, :city_id)
     add_index :rental_property_options, :city_id unless index_exists?(:rental_property_options, :city_id)
     add_column :sale_property_options, :city_id, :integer unless column_exists?(:sale_property_options, :city_id)
     add_index :sale_property_options, :city_id unless index_exists?(:sale_property_options, :city_id)
     add_column :annual_rental_options, :city_id, :integer unless column_exists?(:annual_rental_options, :city_id)
     add_index :annual_rental_options, :city_id unless index_exists?(:annual_rental_options, :city_id)
     

     RentalPropertyOption.all.each do |property|
       next unless property.area.present?
       property.update_attribute(:city_id, property.area.city.id)
     end
     
     SalePropertyOption.all.each do |property|
       next unless property.area.present?
       property.update_attribute(:city_id, property.area.city.id)
     end
     
     AnnualRentalOption.all.each do |property|
       next unless property.area.present?
       property.update_attribute(:city_id, property.area.city.id)
     end
     
   end

   def down
     remove_column :rental_property_options, :city_id if column_exists?(:rental_property_options, :city_id)
     remove_index :rental_property_options, :city_id if index_exists?(:rental_property_options, :city_id)
     remove_column :sale_property_options, :city_id if column_exists?(:sale_property_options, :city_id)
     remove_index :sale_property_options, :city_id if index_exists?(:sale_property_options, :city_id)
     remove_column :annual_rental_options, :city_id if column_exists?(:annual_rental_options, :city_id)
     remove_index :annual_rental_options, :city_id if index_exists?(:annual_rental_options, :city_id)
   end
end


