# file: config/initializers/logrotate.rb
#
# we don't really need to run locally from 'rails server' or 'rails console'
#
# but when we're fired up under passenger, unicorn, or whatever we'll rotate
# our logs on startup and periodically while running (bout every 42 minutes)
#
# 

unless defined?(Rails::Server) or defined?(Rails::Console)

  Thread.new do
    Thread.current.abort_on_exception = true

    sleep(rand(16))

    loop do
      `#{ Rails.root }/script/logrotate`
      sleep(rand(60 * 42))
    end
  end

end