# This migration comes from gko_stickers (originally 20150605102100)
class AddCssToStickers < ActiveRecord::Migration
  def change
    add_column :stickers, :css, :string
  end
end
