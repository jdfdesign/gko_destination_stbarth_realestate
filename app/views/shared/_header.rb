class Shared::Header < Minimal::Template
  include do
    def to_html
      div(:id => "masterhead") { render(:partial => '/shared/masterhead')  }
      div(:id => "site-title-container") { site_title }
      div(:id => "address") do
        self << "T. #{site.find_or_set_setting("phone_number", "000")} - ".html_safe
        if site.inquiry_recipients.try(:present?) and @contact_page = site.sections.named("contact") 
          link_to(site.inquiry_recipients, url_for([@contact_page]))
        else
          mail_to(site.inquiry_recipients, :encode => "javascript")
        end
      end
      render(:partial => '/shared/menu', 
        :locals => {
          :sections => @main_menu, 
          :menu_name => "primary"})
      block.call(:after_primary_menu)
    end

    def site_title
      h2(:id => :'site-title') { capture { link_to(site.title, root_url) } }
      h4 site.subtitle if site.subtitle.present?
    end

  end
end