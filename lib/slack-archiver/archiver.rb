require 'active_support/core_ext/date_time'
require 'slack-archiver/concerns/lazy_options'
require 'slack-archiver/concerns/slack_request'

module SlackArchiver
  class Archiver
    include Let
    include LazyOptions
    include SlackRequest

    let(:now) { DateTime.now.utc }
    let(:end_of_last_week)       { (now.wday - 1).days.ago.utc.end_of_day }
    let(:beginning_of_last_week) { (end_of_last_week - 6.days).utc.at_midnight }

    let(:data_dir) { options[:data_dir] }
    let(:channels) do
      case opts[:channels]
      when :all then all_channels
      else opts[:channels].to_list
      end
    end

    let(:all_channels) { request(:channels_list)['channels'].to_list.map(&id_lens) }
    let(:id_lens)      { ->(x) { x['id'] } }

    let(:channel_dir)     { ->(c) { File.join data_dir, c } }
    let(:channel_history) do
      ->(c) {
        SlackArchiver::Channel.new channel_id: c,
          target_dir: channel_dir.(c),
          oldest:     beginning_of_last_week,
          latest:     end_of_last_week
      }
    end
  end
end
