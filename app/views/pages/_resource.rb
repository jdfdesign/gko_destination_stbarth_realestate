class Pages::Resource < Minimal::Template
  include do
    
    def to_html
      div(:class => [:description, :"#{resource_instance_name}"]) do
        div(:class => [:container, :'description-container']) do
          render_title
          render_body
        end
      end
    end
    
    def render_title
      h1(resource.title, :class => "page-title")
    end
    
    def render_body
      div(:class => :'html-text') do
        resource.body.html_safe
      end if resource.body.present?
    end

  end
end