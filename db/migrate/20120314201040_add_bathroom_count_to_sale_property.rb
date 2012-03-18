class AddBathroomCountToSaleProperty < ActiveRecord::Migration
  def change
    add_column :sale_property_options, :bathroom_count, :integer
  end
end
                                      