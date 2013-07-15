# This migration comes from gko_stickers (originally 20130203153200)
class AddPathToStickers < ActiveRecord::Migration
  include Globalize::ActiveRecord::Migration

  class Sticker < ActiveRecord::Base
    @translated_fields = {
      :path => :string
    }

    def self.translated_fields
      @translated_fields
    end

    translates *@translated_fields.keys
  end

  def up
    unless column_exists?(:stickers, :path)
      add_column :stickers, :path, :string
      Sticker.reset_column_information
      Sticker.translated_fields.each_pair { |field, type| add_column :sticker_translations, field, type }

      Sticker.all.each do |s|
        s.translations.each do |t|
          ::Globalize.locale = t.locale
          s.path = s.name.parameterize if s.name
          s.save
        end
      end
    end
  end

  def down
    Sticker.reset_column_information
    Sticker.translated_fields.keys.each { |field| remove_column :sticker_translations, field }
    remove_column :stickers, :path
  end
end
