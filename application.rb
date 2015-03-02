require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'erb'
enable :sessions


require File.join(File.dirname(__FILE__), 'environment')


configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page, '/root'
get '/' do
  @link_text = "Awesome Sauce"
  erb :root
end

get '/welcome' do
  erb :welcome
end

# welcome form w/ submit
post '/welcome' do
  puts MYDB.mods.inspect
  MYDB.mods << params[:mod]
  @mods = MYDB.mods
  @car = MYDB.car
  @name = MYDB.name
  puts params.inspect
  name = params[:name]
  car = params[:car]
    if params[:name] && params[:car] == ""
      redirect '/error'
    end
      # when to use locals? :locals => {'job' => job, 'name' => name, 'company' => company, 'years' => years}
  erb :welcome, :locals => {'name' => name, 'car' => car, }
end

get '/mods/new' do
  name = params[:name]
  car = params[:car]
  erb :mods_new
end


get '/error' do
  erb :error
end

post '/duties_new' do
  DUTIES << params['duty']
  puts params.inspect
  puts DUTIES.inspect
  redirect '/welcome'
end

post '/duties' do 
  puts params.inspect
  puts DUTIES.inspect
  redirect '/welcome'
end





get '/names/:name' do
end

get '/names/:name/edit' do
end

put '/names/:name' do
  
end

get '/names/:name/remove' do
end

delete '/names/:name' do
end

