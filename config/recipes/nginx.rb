namespace :nginx do
  desc "Setup nginx configuration for this application"
  task :setup do
    template "nginx_unicorn.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /etc/nginx/sites-enabled/#{application}"
    restart
  end
  after "deploy:setup", "nginx:setup"

  %w{start stop restart}.each do |command|
    desc "#{command.capitalize} ngnix"
    task command do
      run "#{sudo} service nginx #{command}"
    end
  end
end
