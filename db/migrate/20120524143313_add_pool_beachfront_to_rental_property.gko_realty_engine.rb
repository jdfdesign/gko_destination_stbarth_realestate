# This migration comes from gko_realty_engine (originally 20120523222222)
class AddPoolBeachfrontToRentalProperty < ActiveRecord::Migration
  def up
    add_column :rental_property_options, :pool, :boolean
    add_column :rental_property_options, :beachfront, :boolean
  end
  
  def down
    remove_column :rental_property_options, :pool
    remove_column :rental_property_options, :beachfront
  end
end
                                      