# frozen_string_literal: true

RSpec.describe Epj do
  it 'has a version number' do
    expect(Epj::VERSION).not_to be nil
  end

  it 'knows the AoC directory' do
    expect(Epj::HOME).to eq(Pathname.new('/home/developer/advent_of_code'))
  end

  it 'can build the path for a sub directory' do
    expect(Epj::HOME / '2021').to eq(Pathname.new('/home/developer/advent_of_code/2021'))
  end
end
