require 'rubygems'
require 'bundler/setup'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'The App of all Apps',
                 :author => 'John O\'Brien',
                 :url_base => 'www.google.com',
                 :test => 'testing?',
                 
                 :links => [
                   { :name => "Google", :href => "http://www.google.com" },
                   { :name => "Reel FX", :href => "http://www.reelfx.com" },
                   { :name => "Yahoo", :href => "http://www.yahoo.com" },
                   { :name => "Basecamp", :href => "http://www.basecamp.com" }
                 ]
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

  DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db"))
end
