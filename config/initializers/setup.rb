ActionMailer::Base.smtp_settings = {
  :address => APP_CONFIG['smtp_address'],
   :port => APP_CONFIG['smtp_port'],
   :domain => APP_CONFIG['smtp_domain'],
   :user_name => APP_CONFIG['smtp_user_name'],
   :password => APP_CONFIG['smtp_password'],
   :authentication => APP_CONFIG['smtp_authentication'],
   :enable_starttls_auto => APP_CONFIG['smtp_enable_starttls_auto'],
   :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE
}
ActionMailer::Base.default_url_options[:host] = "joufdesign.com"
