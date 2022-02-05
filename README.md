# Trainual Take Home Project

Thank you in advance for taking the time to work on this project. This project attempts to simulate work you will be doing as an engineer at Trainual, writing some code from the comfort of your own computer. This project should take about 4 hours to complete and you are free to use any additional dependencies that you see fit.

## Getting Started

Prerequisites (skip if you already have installed):
- Install Ruby ([rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/)) - project version `3.0.2`
- Install [Bundler](https://bundler.io/)

Clone the repository:

HTTPS
```
git clone https://github.com/trainual/EngInterviewProj.git
```

SSH
```
git clone git@github.com:trainual/EngInterviewProj.git
```

Install dependencies:

```
bundle install
```

Create, migrate, and seed your database:

```
rails db:setup
```

Run rails server:

```
rails s
```

Run vite server:

```
yarn start
```

Run tests:

```
bundle exec rspec
```

## The Project

This project is currently setup to view and create a `Document`. After setting up your local database, there should be 5 sample documents created. This project also has unit and system specs that can be found in [/spec](/spec).

Basic flow:

1. Visit `/` to view all documents
1. Click `View` on the document card to view the document
1. Click `Home` to navigate home
1. Click `Create` to create a new document
1. Fill in the required data:
    - Title
    - Description
1. This will create a document that you can then view on `/`

**Required** Acceptance Criteria:
- Build functionality to edit a document
- Save historical versions of a document

_Additional_ Acceptance Criteria (pick at least **one**):
- Add automated tests
- List previous revision dates on the show document page
- Support light and dark mode
- Add authentication
- Duplicate a document in a background job (doesn't need to update UI until the user reloads)

Have questions? Issue starting the application? Please let us know! Steven Templeman ([steven@trainual.com](mailto:steven@trainual.com)) and Jared Gray ([jared@trainual.com](mailto:jared@trainual.com)) are here to help.
