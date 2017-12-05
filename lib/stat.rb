class Stat
  attr_accessor :hostname, :cpu, :disk, :ram, :check_time
  
  def initialize(attributes = {})
    hostname = `hostname`.strip
    check_time = Time.now.strftime("%Y-%m-%d %H:%M")
    @hostname = hostname
    @cpu = "#{attributes[:cpu]}%"
    @disk = attributes[:disk]
    @ram = attributes[:ram]
    @check_time = check_time
  end

  def to_h
    {
     hostname: hostname,
     cpu: cpu,
     disk: disk,
     ram: ram,
     check_time: check_time
    }
  end

  def to_json
    to_h.to_json
  end
end
