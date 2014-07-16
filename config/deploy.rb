# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'recreacion'
set :repo_url, 'git@github.com:shivambidve86/recreacion.git'
#set :repo_url, 'https://shivambidve86:shivam86@github.com/shivambidve86/recreacion.git'

set :deploy_to, -> { "/var/www/#{fetch(:application)}" }
set :rails_env, 'production'

set :linked_files, %w{config/database.yml config/config.yml config/secrets.yml}



# describe the rbenv environment we are deploying into
set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p451'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# dirs we want symlinked to the shared folder
# during deployment
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :use_sudo, true
ssh_options[:keys] = ["E:\2ndSemester\AdvancedClientSideScripting2\cacert/cacert.pem"]

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      #
      # The capistrano-unicorn-nginx gem handles all this
      # for this example
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
