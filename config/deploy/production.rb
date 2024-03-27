# config/deploy/production.rb

server '77.37.47.65', user: 'root', roles: %w{app db web}
set :ssh_options, keys: %w(~/.ssh/id_rsa), forward_agent: true

set :application, "grind_and_pound"
set :repo_url, "git@github.com:ashishpixo/grind_pound_backend.git"

# Default branch is :master
set :branch, 'master'
set :stage, :production
set :rails_env, :production

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/root/grind_pound"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5



namespace :deploy do

 desc 'Restart application'
 task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
 end

 after :publishing, 'deploy:restart'
 after :finishing, 'deploy:cleanup'
end
