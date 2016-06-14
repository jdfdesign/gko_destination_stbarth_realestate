# This migration comes from gko_realty_engine (originally 20150605164000)
class AddFieldsToAnnualRentals < ActiveRecord::Migration
   def change
     add_column :annual_rental_options, :bathroom_count, :integer
     add_column :annual_rental_options, :garden, :boolean
     add_column :annual_rental_options, :accept_roommate, :boolean
     add_column :annual_rental_options, :furnished, :boolean
     add_column :annual_rental_options, :deposit, :integer
     add_column :annual_rental_options, :acreage, :integer
    end
end