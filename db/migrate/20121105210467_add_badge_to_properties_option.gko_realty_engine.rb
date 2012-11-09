# This migration comes from gko_realty_engine (originally 20120530111111)
class AddBadgeToPropertiesOption < ActiveRecord::Migration
  def up
    add_column :rental_property_options, :badge, :string
    add_column :rental_property_option_translations, :badge, :string
    add_column :sale_property_options, :badge, :string
    SalePropertyOption.create_translation_table!({
      :badge => :string
    }, {:migrate_data => true})
  end
  
  def down
    remove_column :rental_property_options, :badge
    remove_column :rental_property_options, :badge
    SalePropertyOption.drop_translation_table! :migrate_data => true
    remove_column :sale_property_options, :badge
  end
end
                                      