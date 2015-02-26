require 'rubygems'
require 'bundler/setup'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'ostruct'


require 'sinatra' unless defined?(Sinatra)
  

class Job
  
  attr_reader :title, :company
  attr_accessor :wage, :hours
  
  def intialize(title, company)
    @title = title
    @company = company
  end
  
end

janitor = Job.new('Janitor', 'Acme')
janitor.wage  #=> nil
janitor.hours #=> nil

janitor.hours = '$10/hr'
janitor.hours #=> '$10/hr'

class Db
  
  attr_accessor :mods, :customers
  
  def initialize(mods = nil, customer = nil, car = nil)
    @mods = mods || []
    @customer = customer || []
    @car = car || []
  end

end

MYDB = Db.new
puts "!!!!! #{MYDB.inspect}"
puts "***** #{MYDB.mods.inspect}"

CARS = []



configure do
  SiteConfig = OpenStruct.new(
                 :title => 'The App of all Apps',
                 :author => 'John O\'Brien',
                 :url_base => 'www.google.com',
                 :test => 'testing mcbizzle?',
                 
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
