# frozen_string_literal: true

require 'thor'
require 'fileutils'
require 'epj'

module Epj
  # The CLI for epj
  class CLI < Thor
    desc 'new [--year year]', 'Initialize a new day'
    option :year, type: :numeric, default: Time.now.year, aliases: [:y]
    option :day, type: :numeric, default: Time.now.day, aliases: [:d]
    option :template, type: :string, default: 'ruby'
    def new
      year = options[:year].to_s
      day = options[:day].to_s.rjust(2, '0')

      puts 'Starting day!'
      puts "+ New #{year}"
      FileUtils.mkdir(Epj::HOME / year)
      puts "+ New #{day}"
      FileUtils.mkdir(Epj::HOME / year / day)

      puts "+ New #{options[:template]}"
      FileUtils.mkdir(Epj::HOME / year / day / options[:template])
    end

    def self.exit_on_failure?
      true
    end
  end
end
