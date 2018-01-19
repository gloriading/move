
Record.destroy_all
Exercise.destroy_all

# Exercise---------------------------------------------------------------------
['yoga', 'swim', 'jogging', 'cycling', 'weight training', 'tai-chi'].each do |exercise_name|
  Exercise.create(name: exercise_name)
end

exercises = Exercise.all
puts Cowsay.say("Create #{exercises.count} exercises", :cow)
# Records -----------------------------------------------------
50.times do
  Record.create(
    date: Faker::Date.between_except(1.month.ago, 1.month.from_now, Date.today),
    duration: rand(5..200),
    note: Faker::Lorem.paragraph
  )
end

records = Record.all
puts Cowsay.say("Create #{records.count} records", :ghostbusters)
