class Pages::Home < Minimal::Template
  include do
    def to_html
      
      unless @images.try(:any?)
        if rental_properties_images.try(:any?)
          div(:id => "wrapper-wide-diaporama ", :class => "wrapper-wide #{resource_instance_name}") do
            div(:id => "diaporama", :class => "container") do
              render :partial => '/images/shared/list', :locals => { :images => rental_properties_images }
            end
          end 
        end 
      end

      div(:class => "row home properties") do
        if rent_section 
          div(:class => "rental_properties") do
            h3 { link_to(t("home.featured_rental_properties"), url_for([rent_section])) }
            if rental_properties.try(:any?)
              ul do
                rental_properties.each { |p| li { div(:class => :inner) { link_to_property(p) } } }
              end
            end
            link_to(t("home.view_all_rental_properties"), url_for([rent_section]), :class => 'view_all')
          end
        end  

        if sale_section
          div(:class => "sale_properties") do
            h3 { link_to(t("home.featured_sale_properties"), url_for([sale_section])) }
            if sale_properties.try(:any?)
              ul do
                sale_properties.each { |p| li { div(:class => :inner) { link_to_property(p) } } }
              end
              link_to(t("home.view_all_sale_properties"), url_for([sale_section]), :class => 'view_all')
            else
              self << t("sale_properties.collection.empty")
            end
          end
        end 
      end
      
      if annual_rent_section and annual_rent_section.body.present?
        div(:class => "row annual_properties") do
           h3 { link_to(annual_rent_section.title, url_for([annual_rent_section])) }
           self << render_html_text(annual_rent_section.body)
        end
      end
      
      #div(:class => "row home about") do
      #  h3 { t("about") }
      #  self << t("home_intro").html_safe
      #end
    end
    
    def link_to_property(property)
      div :class => :thumb do
        link_to(image_fu(property.thumbnail, :medium), url_for([property.section, property]))
      end if property.thumbnail
      
      h2 do 
        link_to(property.title, url_for([property.section, property]), 
          :class => 'entry-title', :rel => 'bookmark')
      end
      
      div :class => 'desc' do
        truncate_html(property.body, :length => 120, :omission => "[...]")
      end unless property.body.blank?

      div(:class => :continue) do 
        capture do
          link_to(:'rental_properties.collection.continue', url_for([property.section, property]), :class => :continue)
        end
      end
    end
    
    def sale_section
      @sale_section ||= site.sections.with_translations(I18n.locale).published.named("sale_properties")
    end
    
    def rent_section
      @rent_section ||= site.sections.with_translations(I18n.locale).published.named("rental_properties")
    end
    
    def annual_rent_section
      @annual_rent_section ||= site.sections.with_translations(I18n.locale).published.named("annual_rental_properties")
    end
    
    def rental_properties_images
      images = []
      rental_properties.each { |p| images << p.images.first } if rental_properties.try(:any?)
      images.flatten.compact.uniq.shuffle
    end
    
    def rental_properties
      @rental_properties ||= rent_section.rental_properties.with_translations(I18n.locale).published.in_homepage
    end
    
    def sale_properties
      @sale_properties ||= sale_section.sale_properties.with_translations(I18n.locale).published.in_homepage
    end

  end
end