# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vps_deploy_generator/version"

Gem::Specification.new do |s|
  s.name        = "vps_deploy_generator"
  s.version     = VpsDeployGenerator::VERSION
  s.authors     = ["miha.mencin"]
  s.email       = ["miha.mencin@mojedelo.com"]
  s.homepage    = ""
  s.summary     = %q{Generator for deployment configuration files}
  s.description = %q{This plugin provides generators for capistrano, unicorn and nginx config files, as seen on railscasts http://railscasts.com/episodes/335-deploying-to-a-vps }

  s.rubyforge_project = "vps_deploy_generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
