class AddSeasonPrototypesTable < ActiveRecord::Migration
   def self.up
      create_table :season_prototypes, :force => true do |t|
        t.references :site
        t.string :title
        t.date :start_date
        t.date :end_date
        t.timestamps
      end
      add_index :season_prototypes, :site_id
    end

    def self.down
      drop_table :season_prototypes
    end
  end
 