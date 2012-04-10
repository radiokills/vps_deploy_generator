# coding: utf-8
class DeployConfigurationGenerator < Rails::Generators::Base
   source_root File.expand_path('../templates', __FILE__) 
   argument :app_name, :type => :string
   argument :app_server, :type=> :string
   argument :app_url, :type=>:string
   argument :server_username, :type=>:string
   argument :git_path, :type=>:string

	def add_gems
		gem("unicorn")
		gem "capistrano"
	end

	def create_config_files
		capify!
		template "Capfile.template", "Capfile"
		template "database.example.yml.template","config/database.example.yml"
		template "deploy.rb.template","config/deploy.rb"
		template "nginx.conf.template","config/nginx.conf"
		template "unicorn.rb.template", "config/unicorn.rb"
		template "unicorn_init.sh.template", "config/unicorn_init.sh"
	end
end
