# README

## Fonix Webchat

### Overview
Fonix Webchat is a real-time messaging application built with Ruby on Rails. This prototype supports a single chat channel where all subscribed users can send and receive messages instantly via WebSockets (Action Cable).

Additionally, the system provides a weekly email report to users, summarizing message activity.

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

### Setup

### Prerequisites
Ensure the following dependencies are installed:

- Ruby 3.3.5
- Rails 8.0.1 (with Solid Cable)
- PostgreSQL
- Sidekiq


### Installation
1. Clone the Repository:
   ```
   git clone git@github.com:dinesh16/ss.git
   cd webchat
   ```

2. Install Dependencies:
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

Once running, access the application at:
👉 `http://localhost:3000`

### Testing
Run the test suite using:
```
rails db:test:prepare
rspec 
```
Testing mail service: Go to rails console and run

```
WeeklySummaryJob.perform_later
```

#### Notes & Future Improvements
🔧 Potential Enhancements
- Improve test coverage by adding feature tests
- Enhance the user interface with improved CSS and UI components.
- Refine views and helper methods for better maintainability.


### Additional Information
- It utilizes Devise for user registration and login.
- The application currently supports a single chat channel, but additional channels can be introduced as needed.
- It utilizes Solid Cable: A database-backed WebSocket implementation, removing the requirement for Redis in real-time features
- SQLite is used for Data storage, and messages are delivered using WebSockets.
- A Cron Job automates the weekly email reports for user message statistics.
