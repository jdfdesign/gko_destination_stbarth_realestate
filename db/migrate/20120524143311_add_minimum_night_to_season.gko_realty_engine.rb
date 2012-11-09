# This migration comes from gko_realty_engine (originally 20120521111111)
class AddMinimumNightToSeason < ActiveRecord::Migration
  def up
    add_column :rental_property_seasons, :minimum_night, :integer, :default => 1
  end
  
  def down
    remove_column :rental_property_seasons, :minimum_night
  end
end
                                      