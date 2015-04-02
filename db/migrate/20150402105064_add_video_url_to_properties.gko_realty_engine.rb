# This migration comes from gko_realty_engine (originally 20150129172600)
class AddVideoUrlToProperties < ActiveRecord::Migration
   def change
     add_column :rental_property_options, :video_url, :string
     add_column :sale_property_options, :video_url, :string
    end
end