class AddOptionContentTable < ActiveRecord::Migration
  def change
    create_table :option_types, :force => true do |t|
      t.string   :name,         :limit => 100
      t.string   :presentation, :limit => 100
      t.integer  :site_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :position, :default => 0, :null => false
    end

    create_table :option_values, :force => true do |t|
      t.references :option_type
      t.string   :name
      t.integer  :position
      t.string   :presentation
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :content_options, :force => true do |t|
      t.references :owner, :polymorphic => true, :limit => 40, :null => false
      t.references :option_type, :null => false
    end
  end
end
 