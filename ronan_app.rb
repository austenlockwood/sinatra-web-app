require 'bundler/setup'
require 'sinatra/base'
require 'pry'

batman = "You want order in Gotham. Batman must take off his mask and turn himself in. Oh, and every day he doesn't, people will die. Starting tonight. I'm a man of my word.

Pretty soon we will be chasing down over due library books.

Peace has cost you your strength. Victory has defeated you."

class RonanApp < Sinatra::Base

  get "/" do
    "WELCOME!"
  end

  get "/:name" do
    "Hello, #{params["name"]}!"
  end

  get "/lorem/:batman" do
    "#{params["batman"]}"
  end
#  if elsif

  run! if app_file == $0
end
