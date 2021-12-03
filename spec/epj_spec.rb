# frozen_string_literal: true

RSpec.describe Epj do
  it 'has a version number' do
    expect(Epj::VERSION).not_to be nil
  end

  it 'knows the AoC directory' do
    expect(Epj.home).to eq(Pathname.new('./tmp/aruba/advent_of_code').expand_path)
  end

  it 'can build the path for a sub directory' do
    expect(Epj.home / '2021').to eq(Pathname.new('./tmp/aruba/advent_of_code/2021').expand_path)
  end
end
