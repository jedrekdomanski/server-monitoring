require 'sinatra'
require 'json'
require_relative './lib/stats'
require_relative './lib/stat'

class App < Sinatra::Base

  stat = Stat.new
  Stat.save(stat)

  get '/status' do
    { stats: Stat.last.to_h }.to_json
  end

  post '/create' do
    puts params
    stat = Stat.last
    if params.include?("cpu")
      stat.cpu = params["cpu"]
      stat.check_time = params["check_time"]
    elsif params.include?("disk")
      stat.disk = params["disk"]
      stat.check_time = params["check_time"]
    elsif params.include?("ram")
      stat.ram = params["ram"]
      stat.check_time = params["check_time"]
    end
    
    status 201
  end
end