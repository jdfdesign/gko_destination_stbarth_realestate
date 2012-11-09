# This migration comes from gko_realty_engine (originally 20120611111111)
class AddExchangePriceToSalePropertiesOption < ActiveRecord::Migration
  def up
    add_column :sale_property_options, :exchange_price, :integer
  end
  
  def down
    remove_column :sale_property_options, :exchange_price
  end
end
                                      