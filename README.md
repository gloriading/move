# Exercise Log
- Home page
  + rails g controller welcome --no-assets --no-helper

- Record: basic CRUD
  + rails g model record note:text duration:integer date:date
  + rails g controller records --no-assets --no-helper

- Exercise:
  + rails g model exercise name

- Link:
  + rails g model link record:references exercise:references

[in exercise.rb]
  has_many :links, dependent: :destroy
  has_many :records, through: :links

[in link.rb]
  belongs_to :record
  belongs_to :exercise

[in record.rb]
  has_many :links, dependent: :destroy
  has_many :exercises, through: :links

- User:
  + rails g model user first_name last_name email password_digest
  + rails g controller users --no-assets --no-helper
  + rails g controller sessions --no-assets --no-helper

- Association: user & records
  + rails g migration add_user_to_records user:references

- User authentication & authorization

- Association: user & Exercises (need this?!)
  + rails g migration add_user_to_exercises user:references

- Nested form on `_form.html.erb`


- Association: colour and exercises
  + rails g model colour name
  + rails g migration add_colour_to_exercises colour:references

- remove colour from exercises table
  + rails g migration remove_colour_from_exercises colour:references

- remove model colour
  + rails d model colour name

- add a column `colour` to exercises table
  + rails g migration add_colour_to_exercises colour:string --force

- to drop the previous colours table
  + rails g migration DropColousTable

    [migration file]
      def up
        drop_table :colours
      end
      def down
        create_table :colours
      end

- about page
  + rails g controller about --no-assets --no-helper

* colour picker
  - gem 'jquery-minicolors-rails'

* simple form with cocoon


* Include `simple calendar`
   - gem "simple_calendar", "~> 2.0"
   <!-- + *= require simple_calendar  -->
   + rails g scaffold Meeting name start_time:datetime end_time:datetime
   + rails g simple_calendar:views

   - In order to use simple calendar, add a column to records table
   + rails g migration add_start_time_to_records start_time:datetime

* Add website logo
  - `<%= favicon_link_tag 'move.ico' %>` to application.html.erb
  - put ico in app/assets/images

* click on a day with existing records brings up a modal


* [ to-do / question]------------------------------------------------
- Want to use simple form error messages for sign in page .. how
- fix all flash messages
- click on a day with existing records brings up a modal
  - in the model put the record and a link to edit

- something wrong with the automatching colour scheme... still.........

- in the new form,
  + providing a list of colours instead of using minicolors?
  + the logic to limit the number of added fields
    - event delegation issues here
    https://learn.jquery.com/events/event-delegation/

  + set a toggle so users do NOT have to input daily

- [user show page]
  + JS to screenshot

- [welcome/index.html.erb]
  + import news from other websites

- Datetime diapley
  https://gist.github.com/eduwass/4ee6b9de3c5013cbd3af
- admin
- friendly id












<!--  -->
