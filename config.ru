$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv/load'
require 'slack_standup'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackStandup::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end


use Rack::Static, urls: ["/hey.png"], root: "public"
run SlackStandup::Web.new
