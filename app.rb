require 'sinatra'
require 'json'
require_relative './lib/stat'

class App < Sinatra::Base
  @@stat = Stat.new
  
  def self.stat
    @@stat
  end

  get '/status' do
    { stats: @@stat.to_h }.to_json
  end

  post '/create' do
    if params.include?("cpu")
      @@stat.cpu = params["cpu"]
      @@stat.check_time = params["check_time"]
    elsif params.include?("disk")
      @@stat.disk = params["disk"]
      @@stat.check_time = params["check_time"]
    elsif params.include?("ram")
      @@stat.ram = params["ram"]
      @@stat.check_time = params["check_time"]
    end
  end
end