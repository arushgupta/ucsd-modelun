set :application, 'ucsd_mun'
set :repo_url, 'git@github.com:arushgupta/rails-sample-app.git'
set :deploy_to, '/var/www/ucsd_mun'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system','public/uploads')
set :format, :pretty
set :log_level, :info
set :scm, :git
set :keep_releases, 5

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name


# Default value for :scm is :git


# Default value for :format is :pretty


# Default value for :log_level is :debug


# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []


# Default value for linked_dirs is []


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:reload'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
