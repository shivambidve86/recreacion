set :user, 'shivazurevm'

set :ssh_options, {
    # verbose: :debug,
    user: fetch(:user)
}

# production deployment
set :stage, :production
# use the master branch of the repository
set :branch, "master"
# the user login on the remote server
# used to connect and deploy
set :deploy_user, "shivazurevm"
# the 'full name' of the application
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
# the server(s) to deploy to
server 'shivazurevm.cloudapp.net', user: 'shivazurevm', roles: %w{web app db}, primary: true
# the path to deploy to
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
# set to production for Rails
set :rails_env, :production


