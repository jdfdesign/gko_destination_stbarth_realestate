# This migration comes from gko_realty_engine (originally 20120523333333)
class AddEndDisplayToRentalProperty < ActiveRecord::Migration
  def up
    add_column :rental_property_options, :end_display, :boolean
  end
  
  def down
    remove_column :rental_property_options, :end_display
  end
end
                                      