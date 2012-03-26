# This migration comes from gko_core (originally 20120319111111)
class AddThemeTable < ActiveRecord::Migration
  def up
    create_table :themes, :force => true do |t|
      t.references :site
      t.string  :name
      t.string  :theme_id
      t.string  :author
      t.string  :version
      t.string  :homepage
      t.text    :summary
      t.integer :active
      
      t.string :document_mime_type
      t.string :document_name
      t.integer :document_size
      t.string :document_uid
      t.string :document_ext
      t.timestamps
    end
    add_column :sites, :theme_id, :integer
    add_index :sites, :theme_id
  end
  
  def down
    drop_table :themes
    add_column :sites, :theme_id, :integer
    remove_index :sites, :theme_id
  end
end  
