require 'spec_helper'
require_relative '../lib/stat'

RSpec.describe App do 

  let(:app) { App }

  describe "GET /status" do
    let(:response) { get "/status" }

    it "returns status 200 OK" do
      expect(response.status).to eq(200)
    end

    it "returns proper JSON" do
      expect(response.body).to eq({ stats: { hostname: "Home", cpu: nil, disk: nil, ram: nil, check_time: nil } }.to_json)
    end
  end

  describe "POST /create" do
    let(:response) { post "/create" }

    it 'returns status 200 OK' do
      expect(response.status).to eq(200)
    end

    it "returns correct JSON when it receives different params" do 

      post "/create", params = { cpu: "20%", check_time: "2018-01-01 19:49" }
      response = get '/status'
      expect(response.body).to eq({ stats: { hostname: "Home", cpu: "20%", disk: nil, ram: nil, check_time: "2018-01-01 19:49" } }.to_json)

      post "/create", params = { ram: "987527MB", check_time: "2018-01-01 19:50" }
      response = get '/status'
      expect(response.body).to eq({ stats: { hostname: "Home", cpu: "20%", disk: nil, ram: "987527MB", check_time: "2018-01-01 19:50" } }.to_json)      
      
      post "/create", params = { disk: "124972MB", check_time: "2018-01-01 19:51" }
      response = get '/status'
      expect(response.body).to eq({ stats: { hostname: "Home", cpu: "20%", disk: "124972MB", ram: "987527MB", check_time: "2018-01-01 19:51" } }.to_json)      
      
    end
  end
end
