require 'net/http'
require_relative '../lib/stats'
require_relative '../lib/stat'
require_relative '../lib/system_checks'
require 'yaml'

path = File.expand_path('../../config/config.yml', __FILE__)

file = YAML.load_file(path)

if file["ram"] == :true
  ram = check_free_ram

  uri = URI('http://localhost:9210/create')
  Net::HTTP.post_form(uri, 'ram' => ram, 'check_time' => Time.now.strftime("%Y-%m-%d %H:%M"))
end
