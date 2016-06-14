# This migration comes from gko_realty_engine (originally 20150827173700)
class AddStatutesToSaleProperties < ActiveRecord::Migration
  def change
    add_column :sale_property_options, :statute_id, :integer
    add_column :annual_rental_options, :statute_id, :integer
  end
end