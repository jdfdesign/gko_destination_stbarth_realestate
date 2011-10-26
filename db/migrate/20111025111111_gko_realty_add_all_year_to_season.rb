class GkoRealtyAddAllYearToSeason < ActiveRecord::Migration
  def self.up
    add_column :rental_property_seasons, :all_year, :boolean, :default => false
  end
  def self.down
    remove_column :rental_property_seasons, :all_year
  end
end
