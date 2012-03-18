class AddClassNameToOptionType < ActiveRecord::Migration
  def change
    add_column :option_types, :class_name, :string, :null => false
    add_column :content_options, :option_value_id, :integer
    add_index :content_options, :option_value_id
  end
end
