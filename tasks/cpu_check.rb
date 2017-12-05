require 'net/http'
require_relative '../lib/stats'
require_relative '../lib/stat'
require_relative '../lib/system_checks'
require 'yaml'

path = File.expand_path('../../config/config.yml', __FILE__)

file = YAML.load_file(path)

if file["cpu"] == :true
  avg_cpu_load = check_avg_cpu_load

  uri = URI('http://localhost:9210/create')
  Net::HTTP.post_form(uri, 'cpu' => avg_cpu_load)
end
