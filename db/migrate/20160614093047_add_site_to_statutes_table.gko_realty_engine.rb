# This migration comes from gko_realty_engine (originally 20150827164800)
class AddSiteToStatutesTable < ActiveRecord::Migration
  def change
    add_column :statutes, :site_id, :integer, :null => false
    add_column :statutes, :name, :string, :null => false
    add_index :statutes, :site_id
  end
end