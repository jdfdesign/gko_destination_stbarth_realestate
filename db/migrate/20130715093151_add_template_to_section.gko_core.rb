# This migration comes from gko_core (originally 20121230114700)
class AddTemplateToSection < ActiveRecord::Migration
  
  include Globalize::ActiveRecord::Migration

  class Section < ActiveRecord::Base
    @translated_fields = {:path => :string}

    def self.translated_fields
      @translated_fields
    end

    translates *@translated_fields.keys
  end
  
  
  def up
    add_column :sections, :template, :string unless column_exists?(:sections, :template) 
    #Section.reset_column_information
    #Section.all.each do |s|
    #  s.update_attributes({:template => s.layout, :layout => nil})
    #end
  end

  def down
    remove_column :sections, :template if column_exists?(:sections, :template)
  end
end