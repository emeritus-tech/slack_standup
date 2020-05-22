module SlackStandup
  module Commands
    class Random < SlackRubyBot::Commands::Base
      BLACKLISTED_ENV_VARS = ['SLACK_API_TOKEN', 'SLACK_RUBY_BOT_ALIASES']

      def self.blacklisted_env_vars
        BLACKLISTED_ENV_VARS.map { |v| "(#{v})" }.join('|')
      end

      match %r{^.*list for (?<team>\w*).*$} do |client, data, match|
        team = match[:team].upcase.gsub(%r{#{blacklisted_env_vars}}, '')
        text = ENV.fetch(team, '').split(',').shuffle.join("\n")
        if text.empty?
          text = "Sorry, I don't have names for #{team.empty? ? 'that' : team} team."
        end
        client.say(channel: data.channel, text: text)
      end

      match %r{^.*CRs for (?<team>\w*).*$} do |client, data, match|
        team = match[:team].upcase.gsub(%r{#{blacklisted_env_vars}}, '')
        text = ENV.fetch(team, '').split(',').shuffle.take(2).join("\n")
        if text.empty?
          text = "Sorry, I don't have names for #{team.empty? ? 'that' : team} team."
        end
        client.say(channel: data.channel, text: text)
      end

      match %r{^.*QA for (?<team>\w*).*$} do |client, data, match|
        team = match[:team].upcase.gsub(%r{#{blacklisted_env_vars}}, '')
        text = ENV.fetch(team, '').split(',').sample
        if text.empty?
          text = "Sorry, I don't have names for #{team.empty? ? 'that' : team} team."
        end
        client.say(channel: data.channel, text: text)
      end
    end
  end
end
