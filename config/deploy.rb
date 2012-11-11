require "rvm/capistrano"
require "bundler/capistrano"

set :application, "vimtips"
set :repository,  "git://github.com/yesmeck/vim-tips.org.git"

set :scm, :git
set :deploy_via, :remote_cache
set :user, "meck"
set :use_sudo, false
set :deploy_to, "/var/www/vim-tips.org"
set :keep_releases, 5

after "deploy:restart", "deploy:cleanup"

server "vim-tips.org", :app, :web, :db, :primary => true

default_run_options[:pty] = true

set :unicorn_config, "#{deploy_to}/current/config/unicorn.rb"

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_config} -D"
  end

  task :stop do
    run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end

  desc "things I need to do after deploy:setup"
  task :setup_config, :roles => :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit #{shared_path}/config/database.yml . And create db: vimtips_production"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
end
