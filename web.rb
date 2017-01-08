require 'sinatra'
require './screenshot'

get '/snap.png' do
  url = params[:url]
  screenshot = Screenshot.new(url)
  send_file screenshot.snap, type: :png
end

get '/' do
  slim :index
end
