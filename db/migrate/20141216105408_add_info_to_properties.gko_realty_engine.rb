# This migration comes from gko_realty_engine (originally 20141214103300)
class AddInfoToProperties < ActiveRecord::Migration
  def up
    add_column :rental_property_options, :info_title, :string
    add_column :rental_property_option_translations, :info_title, :string
    add_column :rental_property_options, :info_body, :text
    add_column :rental_property_option_translations, :info_body, :text
  end
  
  def down
    remove_column :rental_property_options, :info_title
    remove_column :rental_property_option_translations, :info_title
    remove_column :rental_property_options, :info_body
    remove_column :rental_property_option_translations, :info_body
  end
end
          