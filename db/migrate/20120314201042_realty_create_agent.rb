class RealtyCreateAgent < ActiveRecord::Migration
  def change
    create_table :realty_agents, :force => true do |t|
      t.string   :name, :limit => 100
      t.string   :grade, :limit => 100
      t.string   :email, :limit => 100
      t.string   :primary_phone_number_name, :limit => 100
      t.string   :primary_phone_number, :limit => 100
      t.string   :secondary_phone_number_name, :limit => 100
      t.string   :secondary_phone_number, :limit => 100
      t.string   :alt_phone_number_name, :limit => 100
      t.string   :alt_phone_number, :limit => 100
      t.references  :site
      
      t.string :image_mime_type
      t.string :image_name
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.string :image_uid
      t.string :image_ext
      
      t.timestamps
    end
    
    add_column :rental_property_options, :realty_agent_id, :integer
    add_column :sale_property_options, :realty_agent_id, :integer
    add_index :rental_property_options, :realty_agent_id
    add_index :sale_property_options, :realty_agent_id
  end
end