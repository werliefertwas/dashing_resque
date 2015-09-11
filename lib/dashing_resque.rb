require 'active_support/all'
require 'sinatra'
require 'resque'
require 'yaml'

require 'dashing_resque/version'

require 'dashing_resque/routes'

require 'dashing_resque/job'
require 'dashing_resque/jobs/failed_jobs.rb'
require 'dashing_resque/jobs/queued_jobs.rb'

module DashingResque
  class << self
    def init
      config = parse_config
      Resque.redis = config['redis_url']
      Sinatra::Application.settings.sprockets.append_path(assets_path)
    end

    private

    def parse_config
      config_file = File.join(Sinatra::Application.settings.root, *%w(config resque.yml))
      YAML.load_file(config_file)[ENV['RACK_ENV']]
    end

    def assets_path
      File.expand_path(File.dirname(__FILE__))
    end
  end
end
