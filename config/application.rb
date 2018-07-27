require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module OnlineShop
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |generator|
      generator.assets false
      generator.test_framework false
    end
  end
end
