# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141216105408) do

  create_table "annual_rental_options", :force => true do |t|
    t.text     "notes"
    t.integer  "bedroom_count",                  :default => 1
    t.integer  "room_count",                     :default => 1
    t.string   "code",             :limit => 30
    t.integer  "price"
    t.string   "lat_long"
    t.string   "postcode",         :limit => 20
    t.string   "city",             :limit => 30
    t.string   "province_state",   :limit => 30
    t.integer  "country_id"
    t.integer  "area_id"
    t.integer  "property_id"
    t.boolean  "show_in_homepage",               :default => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "city_id"
  end

  add_index "annual_rental_options", ["area_id"], :name => "index_annual_rental_options_on_area_id"
  add_index "annual_rental_options", ["city_id"], :name => "index_annual_rental_options_on_city_id"
  add_index "annual_rental_options", ["country_id"], :name => "index_annual_rental_options_on_country_id"
  add_index "annual_rental_options", ["property_id"], :name => "index_annual_rental_options_on_property_id"

  create_table "areas", :force => true do |t|
    t.string   "name",       :limit => 60
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "areas", ["city_id"], :name => "index_areas_on_city_id"

  create_table "assets", :force => true do |t|
    t.integer  "site_id"
    t.string   "content_type"
    t.integer  "width"
    t.integer  "height"
    t.integer  "size"
    t.string   "source"
    t.string   "source_filename"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "assets", ["site_id"], :name => "index_assets_on_site_id"

  create_table "categories", :force => true do |t|
    t.integer  "site_id"
    t.integer  "section_id"
    t.integer  "parent_id"
    t.integer  "lft",              :default => 0, :null => false
    t.integer  "rgt",              :default => 0, :null => false
    t.string   "name"
    t.string   "slug"
    t.string   "path"
    t.string   "title"
    t.text     "body"
    t.string   "meta_title"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"
  add_index "categories", ["section_id"], :name => "index_categories_on_section_id"

  create_table "categorizations", :force => true do |t|
    t.integer "categorizable_id"
    t.string  "categorizable_type"
    t.integer "category_id"
  end

  add_index "categorizations", ["categorizable_id", "categorizable_type"], :name => "index_categorizations_on_categorizable_id_and_categorizable_type"
  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.text     "meta_description"
    t.text     "body"
    t.string   "path"
    t.string   "title"
    t.string   "slug"
    t.string   "meta_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"

  create_table "cities", :force => true do |t|
    t.string   "name",       :limit => 80
    t.integer  "site_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "content_options", :force => true do |t|
    t.integer "owner_id",                      :null => false
    t.string  "owner_type",      :limit => 40, :null => false
    t.integer "option_type_id",                :null => false
    t.integer "option_value_id"
  end

  add_index "content_options", ["option_value_id"], :name => "index_content_options_on_option_value_id"

  create_table "content_translations", :force => true do |t|
    t.integer  "content_id"
    t.string   "locale"
    t.text     "meta_description"
    t.text     "body"
    t.string   "title"
    t.string   "slug"
    t.string   "meta_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_translations", ["content_id"], :name => "index_content_translations_on_content_id"

  create_table "contents", :force => true do |t|
    t.integer  "site_id"
    t.integer  "section_id"
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "published_at"
    t.string   "layout",           :limit => 40
    t.string   "meta_title"
    t.text     "meta_description"
    t.text     "options"
    t.string   "author_name",      :limit => 120
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                        :default => 1
    t.integer  "access_count",                    :default => 0
  end

  add_index "contents", ["access_count"], :name => "index_contents_on_access_count"
  add_index "contents", ["position", "section_id"], :name => "index_contents_on_position_and_section_id"
  add_index "contents", ["section_id"], :name => "index_contents_on_section_id"
  add_index "contents", ["site_id"], :name => "index_contents_on_site_id"
  add_index "contents", ["slug"], :name => "index_contents_on_slug"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "site_id"
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "document_assignments", :force => true do |t|
    t.integer  "position",                      :default => 1
    t.integer  "document_id",                                  :null => false
    t.integer  "attachable_id",                                :null => false
    t.string   "attachable_type", :limit => 40,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "document_assignments", ["attachable_id", "attachable_type"], :name => "index_document_assignments_on_attachable_id_and_attachable_type"
  add_index "document_assignments", ["document_id"], :name => "index_document_assignments_on_document_id"

  create_table "document_items", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "published_at"
    t.integer  "site_id"
    t.integer  "section_id"
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",           :limit => 5
    t.string   "country"
  end

  add_index "document_items", ["section_id"], :name => "index_press_articles_on_section_id"
  add_index "document_items", ["site_id"], :name => "index_press_articles_on_site_id"

  create_table "document_translations", :force => true do |t|
    t.integer  "document_id"
    t.string   "locale"
    t.string   "alt"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "document_translations", ["document_id"], :name => "index_document_translations_on_document_id"
  add_index "document_translations", ["locale"], :name => "index_document_translations_on_locale"

  create_table "documents", :force => true do |t|
    t.string   "title",                      :limit => 100
    t.string   "lang",                       :limit => 4
    t.string   "alt"
    t.integer  "site_id"
    t.integer  "document_assignments_count",                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
  end

  add_index "documents", ["site_id"], :name => "index_documents_on_site_id"

  create_table "element_images", :id => false, :force => true do |t|
    t.integer  "site_id"
    t.integer  "section_id"
    t.integer  "image_id"
    t.string   "title"
    t.string   "caption"
    t.string   "link"
    t.string   "link_target"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "element_images", ["image_id"], :name => "index_element_images_on_image_id"
  add_index "element_images", ["section_id"], :name => "index_element_images_on_section_id"
  add_index "element_images", ["site_id"], :name => "index_element_images_on_site_id"

  create_table "feature_translations", :force => true do |t|
    t.integer  "feature_id"
    t.string   "locale"
    t.text     "body"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feature_translations", ["feature_id"], :name => "index_feature_translations_on_feature_id"
  add_index "feature_translations", ["locale"], :name => "index_feature_translations_on_locale"

  create_table "features", :force => true do |t|
    t.integer  "site_id"
    t.integer  "section_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "url"
    t.string   "title"
    t.text     "body"
    t.datetime "published_at"
    t.integer  "position",        :default => 1
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_at"
    t.date     "end_at"
  end

  add_index "features", ["owner_type", "owner_id"], :name => "index_features_on_owner_type_and_owner_id"
  add_index "features", ["position", "section_id"], :name => "index_features_on_position_and_section_id"
  add_index "features", ["section_id"], :name => "index_features_on_section_id"
  add_index "features", ["site_id"], :name => "index_features_on_site_id"

  create_table "image_assignments", :force => true do |t|
    t.integer  "position",                      :default => 1
    t.integer  "image_id",                                     :null => false
    t.integer  "attachable_id",                                :null => false
    t.string   "attachable_type", :limit => 40,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_assignments", ["attachable_id", "attachable_type"], :name => "index_image_assignments_on_attachable_id_and_attachable_type"
  add_index "image_assignments", ["image_id"], :name => "index_image_assignments_on_image_id"

  create_table "image_folders", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_folders", ["parent_id"], :name => "index_image_folders_on_parent_id"
  add_index "image_folders", ["site_id"], :name => "index_image_folders_on_site_id"

  create_table "image_folders_images", :id => false, :force => true do |t|
    t.integer  "image_folder_id"
    t.integer  "image_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "image_folders_images", ["image_folder_id", "image_id"], :name => "index_image_folders_images_on_image_folder_id_and_image_id"
  add_index "image_folders_images", ["image_id", "image_folder_id"], :name => "index_image_folders_images_on_image_id_and_image_folder_id"

  create_table "images", :force => true do |t|
    t.integer  "site_id"
    t.integer  "image_assignments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "video_url"
  end

  add_index "images", ["site_id"], :name => "index_images_on_site_id"

  create_table "inquiries", :force => true do |t|
    t.string   "type"
    t.string   "confirmation_code", :limit => 40
    t.string   "to_email"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "open",                            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "confirmed_at"
    t.boolean  "spam",                            :default => false
    t.text     "options"
    t.integer  "site_id"
  end

  add_index "inquiries", ["site_id"], :name => "index_inquiries_on_site_id"

  create_table "languages", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "code"
    t.integer  "position",     :default => 1
    t.string   "presentation"
    t.boolean  "public",       :default => false
    t.boolean  "default",      :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "languages", ["site_id", "position"], :name => "index_languages_on_site_id_and_position"
  add_index "languages", ["site_id"], :name => "index_languages_on_site_id"

  create_table "mail_methods", :force => true do |t|
    t.integer  "site_id",                                                       :null => false
    t.string   "environment",            :default => "production"
    t.boolean  "enable_mail_delivery",   :default => true
    t.string   "mail_host",              :default => "localhost"
    t.string   "mail_domain",            :default => "localhost"
    t.integer  "mail_port",              :default => 25
    t.string   "mail_auth_type",         :default => "none"
    t.string   "smtp_username",                                                 :null => false
    t.string   "smtp_password",                                                 :null => false
    t.string   "secure_connection_type", :default => "None"
    t.string   "mails_from",             :default => "no-reply@joufdesign.com"
    t.string   "mail_bcc"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "mail_methods", ["site_id"], :name => "index_mail_methods_on_site_id"

  create_table "option_type_translations", :force => true do |t|
    t.integer  "option_type_id"
    t.string   "locale"
    t.string   "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_type_translations", ["locale"], :name => "index_option_type_translations_on_locale"
  add_index "option_type_translations", ["option_type_id"], :name => "index_option_type_translations_on_option_type_id"

  create_table "option_types", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                    :default => 0, :null => false
    t.string   "class_name",                                 :null => false
  end

  create_table "option_value_translations", :force => true do |t|
    t.integer  "option_value_id"
    t.string   "locale"
    t.string   "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_value_translations", ["locale"], :name => "index_option_value_translations_on_locale"
  add_index "option_value_translations", ["option_value_id"], :name => "index_7e3c65098a7438807f84e39113d17ccde29e3ec8"

  create_table "option_values", :force => true do |t|
    t.integer  "option_type_id"
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partner_translations", :force => true do |t|
    t.integer  "partner_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partner_translations", ["locale"], :name => "index_partner_translations_on_locale"
  add_index "partner_translations", ["partner_id"], :name => "index_partner_translations_on_partner_id"

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.integer  "site_id"
    t.integer  "section_id"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",        :default => 1
  end

  add_index "partners", ["position", "section_id"], :name => "index_partners_on_position_and_section_id"
  add_index "partners", ["section_id"], :name => "index_partners_on_section_id"
  add_index "partners", ["site_id"], :name => "index_partners_on_site_id"

  create_table "preferences", :force => true do |t|
    t.string   "key",                      :null => false
    t.string   "value_type", :limit => 50
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["key"], :name => "index_preferences_on_key", :unique => true

  create_table "realty_agents", :force => true do |t|
    t.string   "name",                        :limit => 100
    t.string   "grade",                       :limit => 100
    t.string   "email",                       :limit => 100
    t.string   "primary_phone_number_name",   :limit => 100
    t.string   "primary_phone_number",        :limit => 100
    t.string   "secondary_phone_number_name", :limit => 100
    t.string   "secondary_phone_number",      :limit => 100
    t.string   "alt_phone_number_name",       :limit => 100
    t.string   "alt_phone_number",            :limit => 100
    t.integer  "site_id"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rental_property_option_translations", :force => true do |t|
    t.integer  "rental_property_option_id"
    t.string   "locale"
    t.text     "children_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "promo_text"
    t.text     "price_note"
    t.text     "pets_policy"
    t.string   "badge"
    t.string   "info_title"
    t.text     "info_body"
  end

  add_index "rental_property_option_translations", ["rental_property_option_id"], :name => "index_8087d0bf5d52493b8cbc45fdd4426c6365e14280"

  create_table "rental_property_options", :force => true do |t|
    t.text     "children_policy"
    t.text     "notes"
    t.integer  "bedroom_count",                           :default => 1
    t.integer  "bathroom_count",                          :default => 1
    t.integer  "room_count",                              :default => 1
    t.integer  "max_guest"
    t.string   "currency",                  :limit => 1,  :default => "€"
    t.string   "code",                      :limit => 30
    t.integer  "eur_min_price"
    t.integer  "eur_max_price"
    t.integer  "usd_min_price"
    t.integer  "usd_max_price"
    t.string   "lat_long"
    t.string   "postcode",                  :limit => 20
    t.string   "city",                      :limit => 30
    t.string   "province_state",            :limit => 30
    t.integer  "country_id"
    t.integer  "area_id"
    t.integer  "property_id"
    t.boolean  "show_in_homepage",                        :default => false
    t.integer  "start_rates_bedroom_count",               :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "promo_text"
    t.integer  "realty_agent_id"
    t.text     "price_note"
    t.text     "pets_policy"
    t.boolean  "pool"
    t.boolean  "beachfront"
    t.boolean  "end_display"
    t.string   "badge"
    t.integer  "city_id"
    t.string   "info_title"
    t.text     "info_body"
  end

  add_index "rental_property_options", ["area_id"], :name => "index_rental_property_options_on_area_id"
  add_index "rental_property_options", ["city_id"], :name => "index_rental_property_options_on_city_id"
  add_index "rental_property_options", ["country_id"], :name => "index_rental_property_options_on_country_id"
  add_index "rental_property_options", ["property_id"], :name => "index_rental_property_options_on_property_id"
  add_index "rental_property_options", ["realty_agent_id"], :name => "index_rental_property_options_on_realty_agent_id"

  create_table "rental_property_rates", :force => true do |t|
    t.integer  "eur_price"
    t.integer  "usd_price"
    t.integer  "bedroom_count"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rental_property_rates", ["season_id"], :name => "index_rental_property_rates_on_season_id"

  create_table "rental_property_season_translations", :force => true do |t|
    t.integer  "rental_property_season_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rental_property_season_translations", ["rental_property_season_id"], :name => "index_f4c164fa996b80483b6c84ca777347f36478e5ef"

  create_table "rental_property_seasons", :force => true do |t|
    t.string   "title"
    t.integer  "property_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minimum_night", :default => 1
  end

  add_index "rental_property_seasons", ["property_id"], :name => "index_rental_property_seasons_on_property_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "sale_property_option_translations", :force => true do |t|
    t.integer  "sale_property_option_id"
    t.string   "locale"
    t.string   "badge"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "sale_property_option_translations", ["locale"], :name => "index_sale_property_option_translations_on_locale"
  add_index "sale_property_option_translations", ["sale_property_option_id"], :name => "index_629a76235fca137e211a6ec87139ebe1eebb9303"

  create_table "sale_property_options", :force => true do |t|
    t.text     "notes"
    t.integer  "bedroom_count",                  :default => 1
    t.integer  "room_count",                     :default => 1
    t.integer  "acreage"
    t.string   "code",             :limit => 30
    t.integer  "price"
    t.string   "lat_long"
    t.string   "postcode",         :limit => 20
    t.string   "city",             :limit => 30
    t.string   "province_state",   :limit => 30
    t.integer  "country_id"
    t.integer  "area_id"
    t.integer  "property_id"
    t.boolean  "show_in_homepage",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year_built"
    t.integer  "building_size"
    t.integer  "bathroom_count"
    t.integer  "realty_agent_id"
    t.string   "currency",         :limit => 1,  :default => "€"
    t.string   "badge"
    t.integer  "exchange_price"
    t.integer  "city_id"
  end

  add_index "sale_property_options", ["area_id"], :name => "index_sale_property_options_on_area_id"
  add_index "sale_property_options", ["city_id"], :name => "index_sale_property_options_on_city_id"
  add_index "sale_property_options", ["country_id"], :name => "index_sale_property_options_on_country_id"
  add_index "sale_property_options", ["property_id"], :name => "index_sale_property_options_on_property_id"
  add_index "sale_property_options", ["realty_agent_id"], :name => "index_sale_property_options_on_realty_agent_id"

  create_table "season_prototype_translations", :force => true do |t|
    t.integer  "season_prototype_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_prototype_translations", ["locale"], :name => "index_season_prototype_translations_on_locale"
  add_index "season_prototype_translations", ["season_prototype_id"], :name => "index_3014350ba954efd199d77d9abe364e052e93582f"

  create_table "season_prototypes", :force => true do |t|
    t.integer  "site_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_prototypes", ["site_id"], :name => "index_season_prototypes_on_site_id"

  create_table "section_translations", :force => true do |t|
    t.integer  "section_id"
    t.string   "locale"
    t.text     "meta_description"
    t.text     "body"
    t.string   "path"
    t.string   "title"
    t.string   "slug"
    t.string   "redirect_url"
    t.string   "meta_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "menu_title"
    t.text     "alt"
  end

  add_index "section_translations", ["section_id"], :name => "index_section_translations_on_section_id"

  create_table "sections", :force => true do |t|
    t.integer  "site_id"
    t.integer  "parent_id"
    t.integer  "link_id"
    t.string   "link_type"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "type"
    t.string   "name"
    t.string   "slug"
    t.string   "path"
    t.text     "options"
    t.string   "title"
    t.string   "layout"
    t.text     "body"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "redirect_url"
    t.datetime "published_at"
    t.boolean  "hidden",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "menu_title"
    t.boolean  "shallow_permalink", :default => true
    t.boolean  "robot_index",       :default => true
    t.boolean  "robot_follow",      :default => true
    t.boolean  "restricted",        :default => false
    t.string   "template"
    t.text     "alt"
  end

  add_index "sections", ["link_id", "link_type"], :name => "index_sections_on_link_id_and_link_type"
  add_index "sections", ["parent_id", "lft"], :name => "index_sections_on_parent_id_and_lft"
  add_index "sections", ["parent_id"], :name => "index_sections_on_parent_id"
  add_index "sections", ["site_id"], :name => "index_sections_on_site_id"

  create_table "site_translations", :force => true do |t|
    t.integer  "site_id"
    t.string   "locale"
    t.string   "title"
    t.string   "subtitle"
    t.string   "meta_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_translations", ["site_id"], :name => "index_site_translations_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "host"
    t.string   "title"
    t.string   "meta_title"
    t.string   "subtitle"
    t.string   "timezone"
    t.boolean  "public",                   :default => true
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "plugins"
    t.integer  "theme_id"
    t.string   "default_image_uid"
    t.integer  "languages_count",          :default => 0
    t.datetime "liquid_models_updated_at"
    t.text     "page_types"
    t.text     "mailer_settings"
    t.boolean  "front_page_cached",        :default => false
    t.text     "stylesheet"
    t.text     "javascript"
  end

  add_index "sites", ["host"], :name => "index_sites_on_host", :unique => true
  add_index "sites", ["theme_id"], :name => "index_sites_on_theme_id"

  create_table "sticker_translations", :force => true do |t|
    t.integer  "sticker_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
  end

  add_index "sticker_translations", ["sticker_id"], :name => "index_sticker_translations_on_sticker_id"

  create_table "stickers", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
  end

  add_index "stickers", ["name"], :name => "index_stickers_on_name"
  add_index "stickers", ["site_id", "section_id"], :name => "index_stickers_on_site_id_and_section_id"

  create_table "stickings", :force => true do |t|
    t.integer  "sticker_id"
    t.integer  "stickable_id"
    t.string   "stickable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stickings", ["stickable_id", "stickable_type"], :name => "index_stickings_on_stickable_id_and_stickable_type"
  add_index "stickings", ["sticker_id"], :name => "index_stickings_on_sticker_id"

  create_table "text_element_translations", :force => true do |t|
    t.integer  "text_element_id"
    t.string   "locale"
    t.text     "value"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "text_element_translations", ["locale", "text_element_id"], :name => "index_text_element_translations_on_locale_and_text_element_id"

  create_table "text_elements", :force => true do |t|
    t.integer "section_id"
    t.string  "key"
    t.text    "value"
    t.integer "position",   :default => 1
    t.string  "value_type"
  end

  add_index "text_elements", ["key"], :name => "index_text_elements_on_name"
  add_index "text_elements", ["section_id"], :name => "index_text_elements_on_section_id"

  create_table "themes", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "theme_id"
    t.string   "author"
    t.string   "version"
    t.string   "homepage"
    t.text     "summary"
    t.integer  "active"
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "users", :force => true do |t|
    t.string   "email",                                   :default => "", :null => false
    t.string   "encrypted_password",       :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                 :limit => 60
    t.string   "firstname",                :limit => 60
    t.string   "lastname",                 :limit => 60
    t.string   "preferred_language",       :limit => 5
    t.string   "timezone"
    t.integer  "site_registrations_count",                :default => 0
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "failed_attempts",                         :default => 0,  :null => false
    t.datetime "last_request_at"
    t.string   "login"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "site_id"
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["site_id"], :name => "index_users_on_site_id"

end
