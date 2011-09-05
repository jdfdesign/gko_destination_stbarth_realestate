class GkoRealtyCreateTables < ActiveRecord::Migration
   def self.up
      create_table :rental_property_options, :force => true do |t|    
        t.text :children_policy
        t.text :notes
        t.integer :bedroom_count, :default => 1
        t.integer :bathroom_count, :default => 1
        t.integer :room_count, :default => 1
        t.integer :max_guest
        t.string :currency, :limit => 1, :default => "€"
        t.string :code, :limit => 30
        t.integer :eur_min_price
        t.integer :eur_max_price
        t.integer :usd_min_price
        t.integer :usd_max_price
        t.string :lat_long
        t.string :postcode, :limit => 20
        t.string :city, :limit => 30
        t.string :province_state, :limit => 30
        t.references :country
        t.references :area
        t.references :property
        t.boolean :show_in_homepage, :default => false
        t.integer :start_rates_bedroom_count, :default => 1
        t.timestamps
      end
      add_index :rental_property_options, :property_id
      add_index :rental_property_options, :area_id
      add_index :rental_property_options, :country_id
      
      create_table :rental_property_rates, :force => true do |t|
        t.integer :eur_price
        t.integer :usd_price
        t.integer :bedroom_count
        t.integer :season_id
        t.integer :property_id
        t.timestamps
      end
      add_index :rental_property_rates, :property_id 
      add_index :rental_property_rates, :season_id

      create_table :rental_property_seasons, :force => true do |t|
        t.string :title
        t.integer :property_id
        t.date :start_date
        t.date :end_date
        t.timestamps
      end
      add_index :rental_property_seasons, :property_id

      create_table :sale_property_options, :force => true do |t| 
        t.text :notes
        t.integer :bedroom_count, :default => 1
        t.integer :room_count, :default => 1
        t.integer :acreage
        t.string :code, :limit => 30
        t.integer :price
        t.string :lat_long
        t.string :postcode, :limit => 20
        t.string :city, :limit => 30
        t.string :province_state, :limit => 30
        t.references :country
        t.references :area
        t.references :property
        t.boolean :show_in_homepage, :default => false
        t.timestamps
      end
      add_index :sale_property_options, :property_id
      add_index :sale_property_options, :area_id
      add_index :sale_property_options, :country_id
      
      create_table :areas, :force => true do |t|
        t.string :name, :limit => 60
        t.references :site
        t.timestamps
      end
      add_index :areas, :site_id
      
      
    end

    def self.down
      drop_table :rental_property_rates
      drop_table :rental_property_seasons
      drop_table :rental_property_options
      drop_table :sale_property_options
      drop_table :areas
    end
  end
 