class AddCurrencyToSaleProperty < ActiveRecord::Migration
  def change
    add_column :sale_property_options, :currency, :string, :limit => 1, :default => "€"
  end
end
                                      