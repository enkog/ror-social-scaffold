# RoR Social Media Project

The purpose of this project was to implement friendship feature in the project to further consolidate my knowledge of ActiveRecord, associations and RSpec tests.

## Project specifications

*As a guest user:*

- You will be able to create account/log in.
- You can see only “Sign in” and “Sign out” page.

*As a logged-in user:*

- You will be able to see all users list.
- You will be able to see selected user page with their user name and all    posts written by them (the most recent posts on the top).
- You will be able to send a friendship invitation.
- You will see a button “Invite to friendship” next to the name of user who is not your friend yet - on both users’ list and single user page.
- You will be able to see pending friendship invitations sent to you from other users.
- You will be able to accept or reject friendships invitation.
- You will be able to create new posts (text only).
- You will be able to like/dislike posts (but you can like single post only once).
- You will be able to add comments to posts.
- You will be able to see “Timeline” page with posts (with number of likes and comments) written by you and all your friends (the most recent posts on the top).
- Timeline page is the root page of the app.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- VS Code

## Live Demo

TBA

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby
- Rails
- Postgres

### Setup

Install gems with:

``` 
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

``` 
    rpsec
```

## Author

👤 **Oguadinma Nkiruka Ngozika**

-   Github: [@enkog](https://github.com/enkog)
-   Linkedin: [@enkog](https://www.linkedin.com/in/enkog/)
-   Twitter: [@enkodes](https://twitter.com/enkodes)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- <a href="https://www.microverse.org/" target="_blank">Microverse</a> 
- <a href="https://www.theodinproject.com/" target="_blank">The Odin Project</a>
- <a href="https://www.stackoverflow.com/" target="_blank">Stackoverflow</a>