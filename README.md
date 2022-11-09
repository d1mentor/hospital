# Codica test task

Heroku link: https://codicatesttask.herokuapp.com/

Admin panel url: https://codicatesttask.herokuapp.com/admin

Administrator login path: `https://codicatesttask.herokuapp.com/superusers/sign_in`

Administrator logout path: `https://codicatesttask.herokuapp.com/superusers/sign_out`

Doctors profiles сan only be created by an administrator 

steps are necessary to get the application up and running.

Things you may want to cover:

* Ruby version `3.0.0`

* System dependencies
`rails 7.0.4`

* Configuration

* Database creation
`rake db:setup`
`rake db:migrate`

* Database initialization
`rake db:seed`

* How to run the test suite

`rspec spec/features/doctor_give_feedback_spec.rb`

`rspec spec/models/doctor_spec.rb`

`rspec spec/requests/appointment_spec.rb`


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
