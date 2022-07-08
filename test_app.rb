require 'sinatra'

get '/' do
  ENV.each {|k, v| { k: v } }
end
