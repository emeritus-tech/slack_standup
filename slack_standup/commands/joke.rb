module SlackStandup
  module Commands
    class Joke < SlackRubyBot::Commands::Base
      command 'joke', 'tell me a joke', 'give me a joke' do |client, data, _match|
        client.say(channel: data.channel, text: joke)
      end

      private

      def self.joke
        response = Faraday.get('https://icanhazdadjoke.com/', nil, { 'Accept': 'application/json' })
        JSON.parse(response.body)['joke']
      end
    end
  end
end
