class AddPromoToRentalProperty < ActiveRecord::Migration
  def change
    add_column :rental_property_options, :promo_text, :text
    add_column :rental_property_option_translations, :promo_text, :text
  end
end
                                      