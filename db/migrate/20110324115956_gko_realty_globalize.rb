class GkoRealtyGlobalize < ActiveRecord::Migration
  def self.up

    RentalPropertySeason.create_translation_table!({
      :title => :string
    }, {:migrate_data => true})

    RentalPropertyOption.create_translation_table!({
      :children_policy => :text
    }, {:migrate_data => true})

  end
  def self.down
    RentalPropertySeason.drop_translation_table! :migrate_data => true
    RentalPropertyOption.drop_translation_table! :migrate_data => true
  end
end
 