# README

## Fonix Webchat

### Requirements

- The test must be done using Rails.
- Git must be used as version control (if possible push it to github). 
- Messages should be sent through web sockets (Action Cable).

### Description

We want to create a Web chat.

We'll start with a prototype which will have only one channel/room and all the users subscribed will have access to the only available channel.

Users must be able to create an account providing a valid email address. Once logged in users must be able to send and receive messages.

The system should send to all the users a weekly email specifying how many messages were sent and received in the last week and the total number of messages received since the user has sent his last message.
I.e.:

```html
600 messages have been exchanged in the last week. 750 since your last message on the 1st of February.
```

## Setup

### Prerequisites
- Ruby 3.3.5
- Rails 8.0.1 with Solid Cable
- PostgreSQL
- Sidekiq


### Installation
1. Clone the repository:
   ```
   git clone git@github.com:dinesh16/ss.git
   cd project_conversation_history
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. DB Setup:
   ```
   rails db:migrate && rails db:seed
   ```

4. Start the server:
   ```
   bin/dev 
   ```

Go to: `http://localhost:3000`

## Testing
To run the test suite:
```
rspec
```

### Notes

#### Things I would improve:
- Add more specs
- Add bit more css
- Better views, helpers

#### Notes

This application is currently configured with a single channel, but additional channels can be created as needed.

It leverages Hotwire with Rails 8 Solid Cable, eliminating the need for Redis. Instead, Solid Cable utilizes SQLite for data storage, and messages are transmitted via WebSockets.

A cron job has been set up to send weekly message statistics emails to each user, as per the requirements.

