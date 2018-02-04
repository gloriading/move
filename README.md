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

* simple form with cocoon gem

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

* Screenshot (https://github.com/mgrachev/gastly)
  - gem 'gastly'
  - gem 'mini_magick'
  - rails g controller screens --no-assets --no-helper
  - define a helper method in application heler
  - takes several seconds to take the screenshot, so add a loading image
  ?? how to make a screenshot from previous month

* News Feed
  - gem 'feedjira' (http://feedjira.com/)
  - create app/services/feed_builder.rb
    (Use a method to convert incoming data into an array)
  ?? how to let the image/ video content stay within the parent container
  <!-- $('img').css({"width": "50%", "height": "50%"}); -->


* in session/new.html.erb, user custom flash messages
      <%= flash[:alert].present? ? flash[:alert] : nil %>

[solved]

- when render the new record form , when i click on exercise input field
the `- exercise` tab disappears. want to make it not appeared in the first place [ok]

- click on a record in the previous month, the modal shows but freezes [ok]
(opacity thing)


* [ to-do / question] ********************************************
- Screenshot
  ?? how to make a screenshot from previous month
- news feed, articles with Pictures, the pictures sometimes will become very big

- after changing format of record form, the autocomplete does not work

- add `choose another date` to the record form
- get rid of unnecessary gems

- add custom flash messages!


- something wrong with the automatching colour scheme... still.........

- in the new form,
  + colour autocomplete only works for the first pair
  + providing a list of colours instead of using minicolors?

  + set a toggle so users do NOT have to input daily

- [user show page]
  + JS to screenshot

- add minimun width to calendar

- Datetime diapley
  https://gist.github.com/eduwass/4ee6b9de3c5013cbd3af
- admin
- friendly id

* Statistics

- all records for a user (u): u.records
- all exercise-colour pairs
all_exercise ={}
u.records.each do |r|
  r.exercises do |e|
    all_exercise.e.name = e.colour
  end
end













<!--  -->
