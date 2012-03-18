class GlobalizeRealtyFeaturesTable < ActiveRecord::Migration
  def up
    OptionType.create_translation_table!({
      :presentation => :string
    }, {:migrate_data => true})

    OptionValue.create_translation_table!({
      :presentation => :string
    }, {:migrate_data => true})
  end
  def down
    OptionType.drop_translation_table! :migrate_data => true
    OptionValue.drop_translation_table! :migrate_data => true
  end
end
