# config valid only for Capistrano 3.1
require 'rvm/capistrano'
lock '3.10.0'

set :application, 'server-monitoring'
set :repo_url, 'git@bitbucket.org:jedrek_domanski/server-monitoring.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/root/www/server-monitoring'


namespace :deploy do

  desc 'Start application'
  task :start do
    on roles(:web, :app) do
      execute "cd /root/www/server-monitoring/current/ && rackup -p 9210"
    end
  end

  after :publishing, :restart
  after :finishing, 'deploy:cleanup'

end
