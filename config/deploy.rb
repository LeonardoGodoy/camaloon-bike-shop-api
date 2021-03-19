# config valid for current version and patch releases of Capistrano
lock '~> 3.15.0'

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

set :user, 'ec2-user'
set :application, 'camaloon-bike-shop-api'
set :repo_url, 'git@github.com:LeonardoGodoy/camaloon-bike-shop-api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# puma
# set :puma_user, fetch(:user)
set :puma_user, fetch(:user)
set :puma_threads, [4, 16]
set :puma_workers, 0
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_init_active_record, true

# nginx
set :nginx_server_name, 'api.podface.io'
set :nginx_sites_available_path, '/etc/nginx/sites-available'
set :nginx_sites_enabled_path, '/etc/nginx/sites-enabled'
set :nginx_use_ssl, false

set :ssh_options, {
  user: 'ec2-user', # overrides user setting above
  keys: %w[~/.ssh/main_key.pem],
  forward_agent: false,
  auth_methods: %w[publickey]
}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
