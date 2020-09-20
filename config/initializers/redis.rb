# frozen_string_literal: true

if %i[test development].include?(Rails.env.to_sym)
  Redis.current = Redis.new(
    url: ENV['REDIS_URL'],
    port: ENV['REDIS_PORT'],
    db: ENV['REDIS_DB']
  )
else
  SENTINELS = ENV['SENTINEL_HOSTS'].split(' ').map! do |host|
    { host: host, port: ENV['SENTINEL_PORT'] }
  end
  Redis.current = Redis.new(
    url: ENV['SENTINEL_URL'],
    sentinels: SENTINELS,
    role: :master
  )
end
