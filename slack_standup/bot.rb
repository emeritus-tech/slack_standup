module SlackStandup
  class Bot < SlackRubyBot::Bot
    help do
      title 'EE Standup Bot'
      desc 'This bot helps you build a randomized list for the standup :see_no_evil:'

      command 'list for <team>' do
        desc 'Generates a randomly ordered list of people for the team specified'
      end

      command 'joke' do
        desc 'Returns a random dad joke'
      end
    end
  end
end
