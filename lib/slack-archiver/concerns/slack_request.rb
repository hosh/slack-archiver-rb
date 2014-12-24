module SlackArchiver
  module SlackRequest
    def request(api_method, *opts)
      response = Slack.send(api_method, *opts)
      throw "Error: #{response}" unless r['ok']
      return response
    end
  end
end
