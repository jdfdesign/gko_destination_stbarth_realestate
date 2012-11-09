# This migration comes from gko_realty_engine (originally 20121102153600)
class CreateAnnualRentalsTable < ActiveRecord::Migration
   def up
     create_table :annual_rental_options, :force => true do |t| 
       t.text :notes
       t.integer :bedroom_count, :default => 1
       t.integer :room_count, :default => 1
       t.string :code, :limit => 30
       t.integer :price
       t.string :lat_long
       t.string :postcode, :limit => 20
       t.string :city, :limit => 30
       t.string :province_state, :limit => 30
       t.references :country
       t.references :area
       t.references :property
       t.boolean :show_in_homepage, :default => false
       t.timestamps
     end
     add_index :annual_rental_options, :property_id
     add_index :annual_rental_options, :area_id
     add_index :annual_rental_options, :country_id
   end
   
   def down
     drop_table :annual_rental_options
     remove_index :annual_rental_options, :property_id
     remove_index :annual_rental_options, :area_id
     remove_index :annual_rental_options, :country_id
   end
end
