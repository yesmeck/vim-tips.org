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

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
