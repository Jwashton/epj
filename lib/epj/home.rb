# frozen_string_literal: true

require 'pathname'

module Epj
  def self.home
    @@home ||= Pathname.new('~/advent_of_code').expand_path
  end

  def self.home=(new_home)
    @@home = Pathname.new(new_home)
  end
end
