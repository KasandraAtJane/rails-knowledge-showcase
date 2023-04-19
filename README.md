# Welcome

We've created a skeleton Rails Application that only has a User model. Your task is to implement a new Appointment model, a service that receives a CSV of appointment data and creates appointments, and add an API index controller action that returns appointment data based on the params given and the permission level of the user who is signed in. 

Note that we've set up some basic authentication with the Devise gem and forms to create users and login with them. We've added this to facilitate development and manual testing but we're not looking for any further work to be done for the authentication aspect of this project.

## Directions

* Pull down a copy of the Repo and run `bundle`, `bundle exec rake db:setup`

<!-- rails g model Appointment start_at:datetime end_at:datetime patient_id patient_id:integer staff_member_id:integer -->

* Create a new appointment model. The appointments table should have the following fields: start_at (DateTime), end_at (DateTime), patient_id (the id of a user with a 'patient' role), staff_member_id (the id of a user with a 'staff_member' role)
* Add the following validations: A patient cannot have multiple appointments that overlap with each other and an appointment cannot be created in the past
* Create a service that parses a CSV of appointment data like in `lib/assets/appointments.csv`  and creates those appointments
* Create an API appointment index endpoint that returns the following appointment data in JSON:
  * appointment_id
  * patient_id
  * staff_member_id
  * patient name
  * staff member name
  * start_at
  * end_at
  * duration of the appointment

* Possible parameters for filtering for this endpoint can be :patient_id, :staff_member_id, date 
* If a patient tries to access this endpoint, it should be unauthorized
* If a staff member tries to access this endpoint, they should only be authorized to see their own appointment data
* A User with a role of 'super' should be authorized to view all appointment data

Here's what we'll be thinking about when we look at your solution:

* is the coding style consistent?
* is the ruby idiomatic and easy to understand?
* was security taken into consideration when building the solution?
* was performance taken into consideration when building the solution?
* are things that change quickly isolated from things that won't?
* are there concepts that have been made clearer in the way you solved the problem?
* are the solution and specs efficient?
* are the commit message(s) informative?

There isn't a single correct solution to the problem. We've purposely made the problem relatively easy to solve, so that you can focus on all the other stuff. We're eager to see your solution and we're also eager to hear about your experience writing the code. Let us know once your solution is done. If you like, we will offer you some feedback which you could incorporate.
