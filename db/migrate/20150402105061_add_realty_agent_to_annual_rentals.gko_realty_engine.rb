# This migration comes from gko_realty_engine (originally 20150109102600)
class AddRealtyAgentToAnnualRentals < ActiveRecord::Migration
  def change
    add_column :annual_rental_options, :realty_agent_id, :integer
    add_index :annual_rental_options, :realty_agent_id
  end
end