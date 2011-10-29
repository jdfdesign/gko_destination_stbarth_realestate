class GkoRealtyRemovePropertyInRate < ActiveRecord::Migration
  def self.up
    remove_index :rental_property_rates, :property_id
    remove_column :rental_property_rates, :property_id
  end
  def self.down
    add_column :rental_property_rates, :property_id, :integer
    add_index :rental_property_rates, :property_id
  end
end
