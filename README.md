# Inteview Take-Home Project

## Technical Documentation


*The application has new models:*

1. `Student`
2. `ClassRoom`
3. `Section`
   1. Join model to contain information regarding teacher, subject, classroom along with specific section timings and days.
4. `StudentSection`
   1. Join model to contain student enrolled sections

*New Controllers to handle add/remove student section*

1. `SectionsController` has a single action for showing all sections in the system
2. `SchedulesController` handles the request for adding and removing sections from students schedule

*A service class was introduced to handle schedule creation process*

`Schedules::ScheduleCreator` takes in params and current student and validates times/day for new section to be added.
If it has no conflict with the existing sections then adds the new section to student's schedule.
Otherwise redirects and alerts the user.

you can find service class at *`app/services/schedules/schedule_creator`*


### Future enhancements

1. If given more time, I would write tests using rspec
2. Add docker image
3. Replace sqlite with Postgres
4. Create CRUD for other models
5. Add more pages for other data to show






## Overview
This application is meant to represent a school. There are teachers, subjects that they teach, and the relation between them. We want to add classrooms, students, and another model called sections. A section represents a teacher teaching a subject in a specific classroom at a specfic time with students who attend the class. Think of it like the join model between all the other entities, and with specific times. Some sections are taught only on Monday, Wednesday, and Friday, others are only taught on Tuesdays and Thursdays, and some are every day. Sections typically are 50 minutes long, but they can also be 80 minutes. The earliest sections start at 7:30am and the latest ones end at 10pm.

## Goals
1. Students should be able to add/remove sections to their schedule
  - A student cannot be in two sections that overlap
  - For instance, if I add General Chemistry 1 to my schedule, and it's on MWF from 8:00 to 8:50am, I cannot enroll in any other sections between 8:00 and 8:50am on Mondays, Wednesdays, or Fridays.
2. Students should be able to download a PDF of their schedule.
  - For each section include subject, start time, end time, teacher name, and classroom name

## Guidelines
Develop this in your own fork. After you build your models, add a few different records for each model in seeds.rb or use either factories or fixtures. Use any frotend framework you like, or feel free to use server-side rendering. Refactor or remove any existing code necessary, the code currently here is a starting point. Do not bother setting up unnecessary systems right now, like Sidekiq or Devise. Assume that every browser user is a student, so you don't need to think about user management.

## Time Constraints
Do not spend more than 4 hours implementing the goals above. It's not mandatory that the goals above are 100% working, due to the time constraint, we're most interested in seeing your best work. Write this code as if you're contributing to a larger project with multiple developers who will critique your work. If you're running out of time and something isn't funcional yet, that's okay, make sure that whatever is functional is both complete and polished.


