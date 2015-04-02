# This migration comes from gko_realty_engine (originally 20150129170900)
class UpdatePropertyAssignmentsPosition < ActiveRecord::Migration
  def up
    Site.all.each do |site|
      site.sale_property_selection_lists.each do |listing|
        listing.sale_property_assignments.each_with_index do |l, i|
          l.position = i+1
          l.save
        end
      end

      site.rental_property_selection_lists.each do |listing|
        listing.rental_property_assignments.each_with_index do |l, i|
          l.position = i+1
          l.save
        end
      end
    end
  end

  def down

  end
end