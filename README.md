## Mark Six lottery
A lottery system where user can purchase tickets, particpate in draws and can win the lottery

## Installation instructions
```
bin/setup
rails s
bundle exec sidekiq
```

##Platform Dependecies
Ruby - 2.5.3
Rails - 5.2.4
Postgres
Sidekiq
Redis

## Future Enhancements / Limitations
# As of now, I am calculating random winners but there can be different playing strategies like players can opt-in for playing in a particular draw and can select few numbers and winners can be announced based on selected numbers
# There should be a admin panel to configure draw timings, list draws, draw participants and draw results
# As of now, I am using sidekiq-cron to schedule plan in every minute but ideally it should be configurable from admin panel and handled dynamically
# We should also handle the cases if sidekiq is down and draws will be in pending state
# Increase test coverage
# Better user interface