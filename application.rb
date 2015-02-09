require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
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

# root page
get '/' do
  @link_text = "Awesome Sauce"
  erb :root
end

# welcome page
get '/hello/' do
    erb :welcome
end

# form submit
post '/hello/' do
    job = params[:job] || "Oh. I guess you don't work." # what are these things in quotes?
    name = params[:name] || "Nobody" # i thought it might be what returns when input is null?
      if params[:name] == ""
        redirect to('/error')
      end
      
    erb :welcome, :locals => {'job' => job, 'name' => name}
end

get '/error' do
  erb :error
end

get '/root' do
  erb :root
end



# you had me dig in a little bit to see if I could figure out redirects. 
# see above to see where I got! 
# added a tests folder, grabbed it off the web and would love to look through it
