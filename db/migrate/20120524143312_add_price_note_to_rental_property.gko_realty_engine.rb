# This migration comes from gko_realty_engine (originally 20120521222222)
class AddPriceNoteToRentalProperty < ActiveRecord::Migration
  def up
    add_column :rental_property_options, :price_note, :text
    add_column :rental_property_options, :pets_policy, :text
    add_column :rental_property_option_translations, :price_note, :text
    add_column :rental_property_option_translations, :pets_policy, :text
  end
  
  def down
    remove_column :rental_property_options, :price_note
    remove_column :rental_property_options, :pets_policy
    remove_column :rental_property_option_translations, :price_note
    remove_column :rental_property_option_translations, :pets_policy
  end
end
                                      