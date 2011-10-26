class GkoRealtyAddDescription < ActiveRecord::Migration
  def self.up
    add_column :rental_property_options, :description, :text
    add_column :rental_property_option_translations, :description, :text 
  end
  def self.down
    remove_column :rental_property_options, :description
    remove_column :rental_property_option_translations, :description 
  end
end
