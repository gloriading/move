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
