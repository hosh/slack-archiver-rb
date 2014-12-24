require 'rlet'
require 'active_support/core_ext/date_time'

module SlackArchiver
  class Config
    include Let

    attr_reader :base_dir, :data_dir, :token_file

    let(:api_token) { ENV['SLACK_TOKEN'] || File.read(token_file).chomp }
    let(:archiver)  { SlackArchiver::Archiver.new data_dir: data_dir }

    def initialize(opt = {})
      @base_dir = opt[:base_dir]
      @data_dir = opt[:data_dir] || File.join(base_dir, 'data')

      @token_file = opt[:token_file] || File.join(base_dir, '.slack_token')
    end

  end
end
