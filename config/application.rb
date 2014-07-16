require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'log4r'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Recreacion
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    log4r_config = YAML.load(ERB.new(File.read(File.expand_path(File.dirname(__FILE__) + "/log4r.yml"))).result)
    #Log4r::YamlConfigurator.decode_yaml(log4r_config['log4r_config'])
    Recreacion::Application.config.logger = Log4r::Logger[Rails.env]
    config.logger = Log4r::Logger['development']

  end
end
