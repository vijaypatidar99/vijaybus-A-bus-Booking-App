# # Puma can serve each request in a thread from an internal thread pool.
# # The `threads` method setting takes two numbers: a minimum and maximum.
# # Any libraries that use thread pools should be configured to match
# # the maximum value specified for Puma. Default is set to 5 threads for minimum
# # and maximum; this matches the default thread size of Active Record.
# #
# max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
# min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
# threads min_threads_count, max_threads_count

# # Specifies the `worker_timeout` threshold that Puma will use to wait before
# # terminating a worker in development environments.
# #
# worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# # Specifies the `port` that Puma will listen on to receive requests; default is 3000.
# #
# port ENV.fetch("PORT") { 3000 }

# # Specifies the `environment` that Puma will run in.
# #
# environment ENV.fetch("RAILS_ENV") { "development" }

# # Specifies the `pidfile` that Puma will use.
# pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# # Specifies the number of `workers` to boot in clustered mode.
# # Workers are forked web server processes. If using threads and workers together
# # the concurrency of the application would be max `threads` * `workers`.
# # Workers do not work on JRuby or Windows (both of which do not support
# # processes).
# #
# # workers ENV.fetch("WEB_CONCURRENCY") { 2 }
# workers ENV.fetch("WEB_CONCURRENCY") { 4 }
# # Use the `preload_app!` method when specifying a `workers` number.
# # This directive tells Puma to first boot the application and load code
# # before forking the application. This takes advantage of Copy On Write
# # process behavior so workers use less memory.
# #
# app_dir = '/opt/app/www.yoursite.com/current'
# directory app_dir
# rackup "#{app_dir}/config.ru"

#  preload_app!


# # Allow puma to be restarted by `bin/rails restart` command.
# plugin :tmp_restart

threads_count = 32
threads 4, 32

port 8888
environment "production"

app_dir = '/opt/app/www.yoursite.com/current'
directory app_dir
rackup "#{app_dir}/config.ru"

shared_dir = '/opt/app/www.yoursite.com/shared'
workers 8
bind "unix://#{shared_dir}/sockets/puma.sock"
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
daemonize true

preload_app!

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end


on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end


# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

