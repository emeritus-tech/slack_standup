# Random Standup App

Slack bot to generate randomly ordered lists of people for standups. Also tells dad jokes.

## How it works
Each team has its own env var containing a comma-separated list with all the names from the team.

## Getting started

1. The usual ruby stuff `bundle install`.
1. Make sure to have [`foreman`](https://github.com/ddollar/foreman) installed
1. To run the app locally just run `foreman start` (If you are using the real Slack Api Token, all requests from Slack will come to your local environment)

## Deployment

1. Heroku will work just fine
1. It has a web process just to let Heroku run our app, but intrinsically it only needs websocket connections
1. Remember to update the environment variables after/before first deployment

## Notes

Free dynos from Heroku might get to sleep at some point, so we have https://uptimerobot.com configured to ping this app every 60 minutes.
If the dyno is sleeping and you want to use the Random Standup App in Slack, then try sending the message `{host name}/hey.png`.
That will make Slack ping the app and return with an image, hence waking up the app. Otherwise just use a Slackbot command `wake up standup` that will do just the same.

## Code status

Always passing ✅

## License

Copyleft 👈©
