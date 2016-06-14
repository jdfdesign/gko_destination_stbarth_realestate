# This migration comes from gko_realty_engine (originally 20150827154000)
class CreateStatutesTable < ActiveRecord::Migration
  def up
    create_table :statutes, :force => true do |t|
      t.string :title
      t.timestamps
    end
     
    create_table :statute_assignments, :force => true do |t|
      t.integer :statute_id, :null => false
      t.integer :attachable_id, :null => false
      t.string :attachable_type, :null => false, :limit => 40
      t.timestamps
    end
    
    Statute.create_translation_table!({ :title => :string })
  end
  
  def down
    drop_table :statutes
    Statute.drop_translation_table!
    drop_table :statute_assignments
  end
end