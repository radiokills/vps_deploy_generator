VPS DEPLOY CONFIGURATION GENERATOR
==================================

This generator creates configuration for capistrano, unicorn and ngnix deployment

USAGE
-----

`rails generate deploy_configuration APP_NAME APP_SERVER APP_URL SERVER_USERNAME GIT_PATH [options]`

for example:

`rails generate deploy_configuration  myBlog 70.80.91.101 blog.mydomain.com myUser git@github:./myrepo/myapp`

It will create following files:
- config/capistrano.rb
- config/database.example.yml
- config/deploy.yml
- config/nginx.conf
- config/unicorn.rb
- config/unicorn_init.sh

ASSUMPTIONS
------------

When usin this scripts, I assume that:
- You are using ubuntu on your server
- You are usin nginx for your webserver
- You are using unicorn as your app server
- deployer user is able to sudo

