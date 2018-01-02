require 'spec_helper'
require_relative '../lib/stat'

describe Stat do
  let(:stat) { described_class.new }

  it "is expected to have proper attributes" do
    expect(stat).to have_attributes(
      :hostname => "Home",
      :cpu => nil,
      :ram => nil,
      :disk => nil,
      :check_time => nil
    )
  end
end