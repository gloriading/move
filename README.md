# Exercise Log
- Home page
  > rails g controller welcome --no-assets --no-helper

- Record: basic CRUD
> rails g model record note:text duration:integer date:date
> rails g controller records --no-assets --no-helper

- Exercise:
> rails g model exercise name

- Link:
> rails g model link record:references exercise:references

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
> rails g model user first_name last_name email password_digest
> rails g controller users --no-assets --no-helper
> rails g controller sessions --no-assets --no-helper

- Association: user & records
> rails g migration add_user_to_records user:references

- User authentication
- User authorization

- Association: user & Exercises (need this?!)
> rails g migration add_user_to_exercises user:references

- Nested form on `_form.html.erb`


- Association: colour and exercises

> rails g model colour name
> rails g migration add_colour_to_exercises colour:references

* Issue:
`in exercise model`:

  after_initialize :assign_colour

  private
  def assign_colour
    self.colour = Colour.all.sample
  end

`in show, colour changes after reloading`

  <% if @record.exercises != [] %>
      <p>Exercises you did:
        <% @record.exercises.each do |exercise| %>
        <span style="background-color:<%= exercise.colour.name %> ">
          .......
        </span>
        [ <%= exercise.name %> ]
        <% end %>
      </p>
  <% end %>



- remove colour from exercises table
> rails g migration remove_colour_from_exercises colour:references

- remove model colour
>rails d model colour name

- add a column `colour` to exercises table
>rails g migration add_colour_to_exercises colour:string --force

- to drop the previous colours table
> rails g migration DropColousTable
  [migration file]
  def up
    drop_table :colours
  end
  def down
    create_table :colours
  end

- about page
> rails g controller about --no-assets --no-helper



* Questions:

- if the user has a record : volleyball pink
  the next time it creates a new record, after selecting volleyball, pink will be chosen automatically



* colour picker
- gem 'jquery-minicolors-rails'

* simple form with cocoon
- question: after adding a new field, the colour picker doesn't show

<!--  -->
