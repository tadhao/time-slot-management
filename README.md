# README

* Ruby version 3.0.0

* Rails version 7.0.4

#### Description

* The project is about JSON API service which will allow the users to
create time based slots

#### Instructions

* Clone repo
* Run the command `bundle install` to install the required gems
* Add database credentials and rename `database.example` with `database.yml`
* Start the server using `rails s`
* Visit `http://localhost:3000/api/v1/slots` on postman to create new slot with start_date, end_date and total_capacity or seed the test slot from seed file as `rails db:seed`
* Silimarly individual slot with slot_collections can be displayed by calling show action with `http://localhost:3000/api/v1/slots/:id`

#### Future Scope

* Add test cases for various modules could boost-up the security
* Adding microservices for slot allocation could be another way of implementing slot allocation