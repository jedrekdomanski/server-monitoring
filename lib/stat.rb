class Stat
  attr_accessor :hostname, :cpu, :disk, :ram, :check_time
  
  @@stat = []

  def initialize(attributes = {})
    hostname = `hostname`.strip
    @hostname = hostname
    @cpu = attributes[:cpu]
    @disk = attributes[:disk]
    @ram = attributes[:ram]
    @check_time = attributes[:check_time]
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
end