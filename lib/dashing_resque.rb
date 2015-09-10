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
      Sinatra::Application.settings.sprockets.append_path(File.expand_path(File.dirname(__FILE__)))
    end

    private

    def parse_config
      YAML.load_file(File.join(Sinatra::Application.settings.root, *%w(config resque.yml)))[ENV['RACK_ENV']]
    end
  end
end
