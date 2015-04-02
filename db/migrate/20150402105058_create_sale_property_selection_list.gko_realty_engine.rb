# This migration comes from gko_realty_engine (originally 20150106175600)
class CreateSalePropertySelectionList < ActiveRecord::Migration
    def change
        create_table :sale_property_assignments do |t|
            t.references :property, :null => false
            t.references :selection, :null => false
            t.integer :position, :default => 1
        end
        add_index(:sale_property_assignments, [:selection_id, :property_id], :unique => true)
    end
end