# Hoopfinder
## A platform where users can create & join pickup basketball games

Hoopfinder is a website that allows players to sign up and create or join pickup basketball games in their area. The goal of Hoopfinder is to make it easier for people to play pickup basketball, as well as to grow their own community of basketball players.

### Prerequisites

This app is built with `Ruby 2.4.1` and `Rails 5.1.4`. It uses a PostgreSQL database in both development and production. This app is also built with `webpacker`, so there are React library dependencies, and this app uses some React components on the front-end. Hoopfinder utilizes the Google Places API as well as the Google Maps API to display basketball court locations.

**NOTE:** you must have the [`foreman`](https://github.com/ddollar/foreman) gem installed locally in order to run this application on `localhost`, if you wish to do so.

### Getting Started

If you would like to run this project remotely, you can perform the following steps:

1. Clone this repository
2. `cd` into the new `hoopfinder` directory
3. Run `bundle install` to install gem dependencies
4. Run `yarn install` or `npm install` to install the necessary React dependencies
5. In order to start the database server, run the Homebrew command `brew services start postgresql`
6. In your terminal, use `foreman start -f Procfile.dev -p 3000` to start the server where the app will be accessible
7. Use the app on `localhost:3000`
8. When you're done, be sure to stop the database server by using `brew services stop postgresql`
