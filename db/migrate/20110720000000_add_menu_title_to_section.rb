class AddMenuTitleToSection < ActiveRecord::Migration
  def self.up
    add_column :sections, :menu_title, :string
    add_column :section_translations, :menu_title, :string
  end

  def self.down
    remove_column :sections, :menu_title
    remove_column :section_translations, :menu_title
  end
end
