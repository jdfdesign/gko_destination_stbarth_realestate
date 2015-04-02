# This migration comes from gko_realty_engine (originally 20150109153800)
class CreateRentalPropertySelectionList < ActiveRecord::Migration
    def change
        create_table :rental_property_assignments do |t|
            t.references :property, :null => false
            t.references :selection, :null => false
            t.integer :position, :default => 1
        end
        add_index(:rental_property_assignments, [:selection_id, :property_id], :unique => true, :name => "rental_property_assignment_property_id")
    end
end