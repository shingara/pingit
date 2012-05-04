# Use at least one worker per core
worker_processes ENV['UNICORN_WORKER_PROCESS'].to_i

# Nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# Use "preload_app true"
preload_app true

if ENV['UNICORN_LISTEN']
  listen ENV['UNICORN_LISTEN']
end

if ENV['UNICORN_PID']
  pid ENV['UNICORN_PID']
end

if ENV['UNICORN_STDOUT_PATH']
  stdout_path ENV['UNICORN_STDOUT_PATH']
end

if ENV['UNICORN_STDERR_PATH']
  stderr_path ENV['UNICORN_STDERR_PATH']
end

after_fork do |server, worker|
  Sidekiq.configure_server do |config|
    config.redis = Yaml.load(
      ERB.new(
        File.read(File.join(File.dirname(__FILE__), 'sidekiq_config.yml'))
      ).result
    )[ENV[RACK_ENV]]
  end
end

