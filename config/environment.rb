# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'
require 'pathname'
require 'logger'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'byebug' if development?
require 'erb'
require 'json'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path

  # Set the views to
  set :views, File.join(Sinatra::Application.root, 'app', 'views')
end

# Set up libs
Dir[APP_ROOT.join('lib/**', '*.rb')].each { |file| require file }

# Set up helpers
Dir[APP_ROOT.join('app', 'helpers/**', '*.rb')].each { |file| require file }

# Set up services
Dir[APP_ROOT.join('app', 'services/**', '*.rb')].each { |file| require file }

# Set up controllers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
