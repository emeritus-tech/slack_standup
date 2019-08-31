module SlackStandup
  module Commands
    class Random < SlackRubyBot::Commands::Base
      command 'list' do |client, data, _match|
        text = ENV.fetch('USERS').split(',').shuffle.join("\n")
        client.say(channel: data.channel, text: text)
      end
    end
  end
end
