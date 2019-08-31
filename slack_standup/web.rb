module SlackStandup
  class Web
    def call(env)
      response = 'Standup Bot'
      [200, {'Content-Type' => 'text/plain', 'Content-Size' => response.size.to_s}, [response]]
    end
  end
end
