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

* remove user column in exercises table
  > rails g migration RemoveUserFromExercises user:references

* Statistics
  - chart.js

[solved]

- when render the new record form , when i click on exercise input field
the `- exercise` tab disappears. want to make it not appeared in the first place [ok]

- click on a record in the previous month, the modal shows but freezes [ok]
  (opacity thing)

- new record button in the modal, but won't show the date: [ok]
  - a regular new record has path like this:
    http://localhost:3000/records/new?date=2018-02-21
  - in user show page, pass 'the date of the record selected'
  - <%= link_to 'new record',      
        "#{new_record_path}?date=#{r.start_time.strftime("%Y-%m-%d")}",
        class:"btn btn-light btn-sm btn-block" %>

- how to select a certain month?
  - in user show page:
    on the screenshot link, send the start_date as a param in the path
  - in screens controller, capture the start_date


* [ to-do / question] ********************************************

- ?! dropdown menu only show months where the user has a record

- how to select different month?
  in users controller #show
  current_month_rec = @user.records.where('start_time >?',DateTime.now.beginning_of_month)


- how to let user download the screenshots

- text-wrap/overflow thing within the calendar

- provide a list of exercise that has been recorded before with a drop down menu


- after changing format of record form, the autocomplete does not work


- automatching colour scheme... records/new.html.erb
  + when click on edit, no autocomplete
  + click on jan 9, no recoreds filled

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
- get rid of unnecessary gems



- trying Ajax request
> rails g controller Api::V1::Charts --no-assets --no-helper

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :charts
    end
  end

> rails g controller Api::Application --no-assets --no-helper --skip-template-engine
> rails g migration add_api_key_to_user api_key:string


<!--  -->
