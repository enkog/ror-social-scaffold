# Scaffold for social media app with Ruby on Rails

The purpose of this project was to implement friendship feature in the project to further consolidate my knowledge of ActiveRecord, associations and RSpec tests.

## Project specifications

_As a guest user:_

- You will be able to create account/log in.
- You can see only “Sign in” and “Sign out” page.

_As a logged-in user:_

- You will be able to see all users list.
- You will be able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
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

## Live Demo

[Live Demo](https://mysterious-escarpment-85334.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.


## Authors

- Github: [@enkog](https://github.com/enkog)
- Linkedin: [@enkog](https://www.linkedin.com/in/enkog/)
- Twitter: [@enkodes](https://twitter.com/enkodes)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- <a href="https://www.microverse.org/" target="_blank">Microverse</a>
- <a href="https://www.theodinproject.com/" target="_blank">The Odin Project</a>
- <a href="https://www.stackoverflow.com/" target="_blank">Stackoverflow</a>

