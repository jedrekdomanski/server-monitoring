require 'sinatra'
require 'json'
require_relative './lib/stats'
require_relative './lib/stat'

class App < Sinatra::Base

  get '/status' do
    stats = Stats.all
    { stats: stats.map(&:to_h) }.to_json
  end

  post '/create' do
    stat = Stat.new(cpu: params[:cpu], disk: params[:disk], ram: params[:ram])
    Stats.save(stat)
  
    status 201
  end

end