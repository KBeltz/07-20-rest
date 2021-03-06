require 'rubygems'
require 'bundler/setup'

require "pry"
require "sinatra"
require "sinatra/reloader"
require "active_record"
require "bcrypt"

configure :development do
  require "sqlite3"
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'stories.db')
end

configure :production do
  require "pg"
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/user.rb"
require_relative "models/story.rb"

#Controllers
require_relative "controllers/users_controller.rb"
require_relative "controllers/stories_controller.rb"
require_relative "controllers/main_controller.rb"
require_relative 'controllers/login_helper.rb'
