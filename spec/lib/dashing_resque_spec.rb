require 'spec_helper'

describe DashingResque do
  describe '.init' do
    let(:lib_path) { '/some/random/path' }
    let(:sinatra_root) { '/var/apps/dashing' }
    let(:resque_config_path) { "#{sinatra_root}/config/resque.yml" }
    let(:redis_url) { 'redis://redishost:6379' }
    let(:config) { { 'test' => { 'redis_url' => redis_url } } }
    let(:sprockets) { double('sprockets') }

    before do
      allow(described_class).to receive(:assets_path) { lib_path }
      allow(Sinatra::Application.settings).to receive(:root) { sinatra_root }
      allow(YAML).to receive(:load_file).with(resque_config_path) { config }
      allow(Sinatra::Application.settings).to receive(:sprockets) { sprockets }
      allow(sprockets).to receive(:append_path)
    end

    it 'sets the redis url' do
      expect(Resque).to receive(:redis=).with(redis_url)
      described_class.init
    end

    it 'appends the correct path to sprockets assets paths' do
      expect(sprockets).to receive(:append_path).with(lib_path)
      described_class.init
    end
  end
end
