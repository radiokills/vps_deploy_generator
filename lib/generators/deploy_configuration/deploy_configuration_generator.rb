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

	def tasks_to_do
		puts %Q{
***************************************
YOUR CONFIG FILES WERE GENERATED
***************************************
Now you should:
	1. Set executable flags on unicorn_init.sh script
	
		chmod +x config/unicorn_init.sh
	
	------------------------------------------------------
	2. Add new files to git
	
		git add .
		git commit -a -m 'Deployment config files'
		git push origin master

	------------------------------------------------------
	3. Setup deploy
		
		cap deploy:setup

	------------------------------------------------------
	4. Edit database configuration
		
		ssh #{server_username}@#{app_server}
		cd apps/#{app_name}/shared/config
		nano database.yml
	------------------------------------------------------
	5. Log off your server and Deploy app
		
		cap deploy:cold

	------------------------------------------------------
	6. ssh to your server again and update rc.d
		
		ssh #{server_username}@#{app_server}
		sudo update-rc.d unicorn_#{app_name} defaults
	
	7. Restart nginx

		sudo /etc/init.d/nginx restart

	}
	

	end
end
