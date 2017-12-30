def check_avg_cpu_load
  "#{IO.readlines("/proc/loadavg").first.split[1..1].first.to_f * 100}"
end

def check_free_disk_space
  "#{`df -m /dev/sda3`.split[11].to_i}MB"
end

def check_free_ram
  %x(free).split(" ")[9]
end