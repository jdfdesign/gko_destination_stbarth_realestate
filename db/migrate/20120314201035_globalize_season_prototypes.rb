class GlobalizeSeasonPrototypes < ActiveRecord::Migration
  def self.up
    SeasonPrototype.create_translation_table!({
      :title => :string
    }, {:migrate_data => true})
  end
  def self.down
    SeasonPrototype.drop_translation_table! :migrate_data => true
  end
end
 