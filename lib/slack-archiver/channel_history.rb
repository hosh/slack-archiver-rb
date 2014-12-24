require 'rlet'
require 'active_support/core_ext/date_time'
require 'slack-archiver/concerns/lazy_options'
require 'slack-archiver/concerns/slack_request'

module SlackArchiver
  class ChannelHistory
    include Let
    include LazyOptions
    include SlackRequest

    let(:channel_id) { options[:channel_id] }
    let(:count)      { options[:count] || 1000 }
    let(:oldest)     { options[:oldest] }
    let(:latest)     { options[:latest] }

    let(:target_dir) { options[:target_dir] }

    let(:messages)       { response['messages'] }
    let(:latest_message) { response['latest'] }
    let(:has_more?)      { response['has_more'] }

    let(:response) { Slack.channels_history channel: channel_id, count: count, oldest: oldest, latest: latest }
    let(:ok?)      { response['ok'] }

    let(:datetime) { ->(t) { DateTime.strptime(t, '%s') } }

    let(:archive!) do
    end
  end
end
