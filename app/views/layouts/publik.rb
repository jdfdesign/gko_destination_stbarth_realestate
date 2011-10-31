require_dependency 'layouts/base_public.rb'
class Layouts::Publik < Layouts::BasePublic
  include do
    
    def html
      content_for :before_stylesheet_libraries do
        stylesheet_link_tag("gko-core/public/jquery-ui", "screen", :cache => "compiled/screen") 
      end

      content_for :before_javascript_libraries do
        self << raw('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>')
        self << raw('<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>')
        
        javascript_include_tag( "gko-core/rails",
                                "gko-core/gko/core",
                                "gko-core/jquery.mobile.events.js",
                                "gko-core/gko/galleria", 
                                "public", :cache => "compiled/public")
      end
      super
    end

    def content
      if @images.try(:any?)
        div(:id => "wrapper-wide-diaporama ", :class => "wrapper-wide #{resource_instance_name}") do
          div(:id => "diaporama", :class => "container") do
            render :partial => '/images/shared/list', :locals => { :images => @images }
          end
        end 
      end
      super
    end 

  end
end
