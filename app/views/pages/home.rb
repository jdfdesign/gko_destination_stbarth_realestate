class Pages::Home < Minimal::Template
  include do
    def to_html
      
      div(:class => "home properties") do
        if rental_properties.any?
          div(:class => "rental_properties") do
            h3("Villas la location".html_safe)
            ul do
              rental_properties.each do |p|
                li { div(:class => :inner) { link_to_property(p) } }
              end
            end
          end
        end
      
        if sale_properties.any?
          div(:class => "sale_properties") do
            h3("Villas la vente".html_safe)
            ul do
              sale_properties.each do |p|
                li { div(:class => :inner) { link_to_property(p) } }
              end
            end
          end
        end
      
      end
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
    
    def rental_properties
      @rental_properties ||= site.rental_properties.with_translations(I18n.locale).published.in_homepage
    end
    
    def sale_properties
      @sale_properties ||= site.sale_properties.with_translations(I18n.locale).published.in_homepage
    end

  end
end