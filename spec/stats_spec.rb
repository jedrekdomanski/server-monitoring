require_relative '../lib/stats'
require_relative '../lib/stat'


describe "Statistics" do
  context "Creation" do

    let(:stat) { Stat.new }

    it "new stat should have hostname and check time as defaults" do
      expect(stat.hostname).to eq(`hostname`.strip)
      expect(stat.check_time).to eq(Time.now.strftime("%Y-%m-%d %H:%M"))
    end

    it "should be possible to create a new stat only with one attribute" do
      stat.cpu = 20
      expect(stat.cpu).to eq(20)
    end

    it "creating a new stat should update Stats count" do
      Stats.save(stat)
      expect(Stats.all.count).to eq(1)
    end
  end
end
