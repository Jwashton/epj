# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'

RSpec.describe 'CLI initializing a new day ', type: :aruba do

  context 'with an empty home' do
    before do
      path = Epj::HOME.glob('*')
      FileUtils.rm_r(path, secure: true)
    end

    context 'with the defaults' do
      let(:year) { Time.now.year.to_s }
      let(:day) { Time.now.day.to_s }

      before do
        run_command('epj new')
      end

      it 'creates the year directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(year)}/)
        expect(Dir.exist?(Epj::HOME / year)).to be(true)
      end

      it 'creates the day directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(day)}/)
        expect(Dir.exist?(Epj::HOME / year / day)).to be(true)
      end

      it 'creates the ruby directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('ruby')}/)
        expect(Dir.exist?(Epj::HOME / year / day / 'ruby')).to be(true)
      end
    end

    context 'with a specific year' do
      let(:year) { '2019' }
      let(:day) { Time.now.day.to_s }

      before do
        run_command("epj new --year #{year}")
      end

      it 'creates the year directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(year)}/)
        expect(Dir.exist?(Epj::HOME / year)).to be(true)
      end

      it 'creates the day directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(day)}/)
        expect(Dir.exist?(Epj::HOME / year / day)).to be(true)
      end

      it 'creates the ruby directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('ruby')}/)
        expect(Dir.exist?(Epj::HOME / year / day / 'ruby')).to be(true)
      end
    end

    context 'with a short year flag' do
      let(:year) { '2019' }
      let(:day) { Time.now.day.to_s }

      before do
        run_command("epj new -y #{year}")
      end

      it 'creates the year directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(year)}/)
        expect(Dir.exist?(Epj::HOME / year)).to be(true)
      end

      it 'creates the day directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(day)}/)
        expect(Dir.exist?(Epj::HOME / year / day)).to be(true)
      end

      it 'creates the ruby directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('ruby')}/)
        expect(Dir.exist?(Epj::HOME / year / day / 'ruby')).to be(true)
      end
    end

    context 'with a specific day' do
      let(:year) { Time.now.year.to_s }
      let(:day) { '4' }

      before do
        run_command("epj new --day #{day}")
      end

      it 'creates the day directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(day)}/)
        expect(Dir.exist?(Epj::HOME / year / '04')).to be(true)
      end

      it 'creates the ruby directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('ruby')}/)
        expect(Dir.exist?(Epj::HOME / year / '04' / 'ruby')).to be(true)
      end
    end

    context 'with a short day flag' do
      let(:year) { Time.now.year.to_s }
      let(:day) { '4' }

      before do
        run_command("epj new -d #{day}")
      end

      it 'creates the day directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote(day)}/)
        expect(Dir.exist?(Epj::HOME / year / '04')).to be(true)
      end
    end

    context 'with a specific template' do
      let(:year) { Time.now.year.to_s }
      let(:day) { Time.now.day.to_s }

      before do
        run_command('epj new --template plaintext')
      end

      it 'creates the plaintext directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('plaintext')}/)
        expect(Dir.exist?(Epj::HOME / year / day / 'plaintext')).to be(true)
      end
    end

    context 'with a short template flag' do
      let(:year) { Time.now.year.to_s }
      let(:day) { Time.now.day.to_s }

      before do
        run_command('epj new -t plaintext')
      end

      it 'creates the plaintext directory' do
        expect(last_command_started).to have_output(/#{Regexp.quote('plaintext')}/)
        expect(Dir.exist?(Epj::HOME / year / day / 'plaintext')).to be(true)
      end
    end
  end
end
