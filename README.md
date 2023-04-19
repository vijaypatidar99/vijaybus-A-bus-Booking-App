
## VijayBus
VijayBus is a web-based bus booking application built using Ruby on Rails framework. This application allows users to search for buses and book tickets for various routes. It also provides an admin dashboard to manage buses, routes, and ticket bookings.

## Features
User authentication with email and password.
User registration with email verification.
Role-based access control with two roles - User and Admin.
User can search for buses and routes.
User can book tickets for a selected bus and route.
User can print the ticket after booking.
User can receive the e-ticket through email after booking.
Admin can create new buses and routes.
Admin can manage ticket bookings by accepting or rejecting them.

## Usage

## User
1. Register as a new user.
2. Log in to the application using your email and password.
3. Search for buses and routes.
4. Book a ticket for a selected bus and route.
5. Print the ticket or receive the e-ticket through email.

## Admin
1. Log in to the application as an admin.
2. Create new buses and routes.
3. Manage ticket bookings by accepting or rejecting them.


## Getting started

To get started with the app, first follow the setup steps:

Next, clone the repo and `cd` into the directory:

```
$ git clone  https://github.com/vijaypatidar99/vijaybus 
$ cd Vijaybus
```

Also make sure you’re using a compatible version of Node.js:

```
$ nvm install 16.13.0
$ node -v
v16.13.0
 $ ruby v-3.0.1
 $ rails v-7.0.4.3
```

Then install the needed packages (while skipping any Ruby gems needed only in production):

```
$ yarn add jquery@3.5.1 bootstrap@3.4.1
$ gem install bundler -v 2.2.17
$ bundle _2.2.17_ config set --local without 'production'
$ bundle _2.2.17_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```



## Help

Contributing If you find a bug or have a feature request, please open an issue.

If you would like to contribute to VijayBus, please fork the repository and submit a pull request.

License VijayBus is released under the MIT License.
