# This migration comes from gko_realty_engine (originally 20150108142600)
class AddPositionToRealtyAgent < ActiveRecord::Migration
  def change
    add_column :realty_agents, :position, :integer, :default => 1
  end
end