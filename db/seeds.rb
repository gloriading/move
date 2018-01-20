PASSWORD = '123'

Record.destroy_all
Exercise.destroy_all
User.destroy_all

# user --------------------------------------------------------------------
super_user = User.create(
  first_name: 'Gloria',
  last_name: 'Ding',
  email: 'gd@gmail.com',
  password: 'PASSWORD'
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all
puts Cowsay.say("Create #{users.count} users", :tux)

# Exercise---------------------------------------------------------------------
['yoga', 'swim', 'jogging', 'cycling', 'weight training', 'tai-chi'].each do |exercise_name|
  Exercise.create(
    name: exercise_name,
    user: users.sample
  )
end

exercises = Exercise.all
puts Cowsay.say("Create #{exercises.count} exercises", :cow)


# Records --------------------------------------------------------------------
50.times do
  Record.create(
    date: Faker::Date.between_except(1.month.ago, 1.month.from_now, Date.today),
    duration: rand(5..200),
    note: Faker::Lorem.paragraph,
    user: users.sample,
    exercises: [exercises.sample] 
  )
end

records = Record.all
puts Cowsay.say("Create #{records.count} records", :ghostbusters)
