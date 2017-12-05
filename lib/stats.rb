class Stats
  @@stats = []
 
  def self.save(stat)
    @@stats << stat
  end

  def self.all
    @@stats
  end
end