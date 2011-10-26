require_dependency 'layouts/base_public.rb'
class Layouts::Publik < Layouts::BasePublic
  include do
    
    def html
      content_for :head do
        stylesheet_link_tag("screen", :cache => "compiled/public")

        javascript_include_tag( "gko-core/jquery-1.6.2.min.js",
                                "gko-core/jquery-ui-1.8.11.custom.min.js",
                                "gko-core/rails",
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
