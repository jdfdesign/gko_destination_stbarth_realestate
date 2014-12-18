source 'https://rubygems.org'

group :assets do
  gem 'sass', '= 3.2.14'
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 2.4.0'
end

group :production do
  git "git@github.com:jdfdesign/gko_cms3.git", :tag => "v0.8.14.1" do
    gem 'gko_core'
    gem 'gko_auth'
    gem 'gko_documents'
    gem 'gko_inquiries'
    gem 'gko_features'
    gem 'gko_categories'
    gem 'gko_stickers'
  end
  gem 'gko_realty', :git => 'git@github.com:jdfdesign/gko-realty.git'
end

# group :development do
#  gem "gko_core", :path => File.expand_path('~/Github/gko_cms3/gko_core', __FILE__)
#  gem "gko_auth", :path => File.expand_path('~/Github/gko_cms3/gko_auth', __FILE__)
#  gem "gko_documents", :path => File.expand_path('~/Github/gko_cms3/gko_documents', __FILE__)
#  gem "gko_inquiries", :path => File.expand_path('~/Github/gko_cms3/gko_inquiries', __FILE__)
#  gem "gko_features", :path => File.expand_path('~/Github/gko_cms3/gko_features', __FILE__)
#  gem "gko_categories", :path => File.expand_path('~/Github/gko_cms3/gko_categories', __FILE__)
#  gem "gko_stickers", :path => File.expand_path('~/Github/gko_cms3/gko_stickers', __FILE__)
#  gem "gko_realty", :path => File.expand_path('~/Github/gko/gko_realty', __FILE__) 
# end

gem "money", "= 5.0.0"
gem "eu_central_bank", "~> 0.3.2"
gem "whenever", "~> 0.7.3"
gem "nokogiri", "~> 1.5.0"