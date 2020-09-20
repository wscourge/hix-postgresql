# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-scheduler'

# Sidekiq::Extensions.enable_delay!

if Rails.env.test? || Rails.env.development?
  defaults = {
    url: ENV['REDIS_URL'],
    db: ENV['REDIS_DB'],
    namespace: ENV['SIDEKIQ_NAMESPACE']
  }
else
  SENTINELS = ENV['SENTINEL_HOSTS'].split(' ').map! do |host|
    { host: host, port: ENV['SENTINEL_PORT'] }
  end

  defaults = {
    url: ENV['SENTINEL_URL'],
    sentinels: SENTINELS,
    role: :master,
    namespace: ENV['SIDEKIQ_NAMESPACE']
  }
end

Sidekiq.configure_server do |config|
  config.redis = defaults.merge(size: 50)
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(Rails.root.join('config/sidekiq_scheduler.yml').to_s) || {}
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = defaults.merge(size: 10)
end
