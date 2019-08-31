module SlackStandup
  class Bot < SlackRubyBot::Bot
    help do
      title 'EE Standup Bot'
      desc 'This bot helps you build a randomized list for the standup :see_no_evil:'

      command 'list' do
        desc 'Generates a list of people with random order to use in the standup'
      end

      command 'joke' do
        desc 'Returns a random dad joke'
      end
    end
  end
end
