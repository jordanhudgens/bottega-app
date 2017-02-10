1.times do |user|
    User.create!(email:"test@test.com", password:"asdfasdf")
end

puts "1 users created"

100.times do |event|
    Event.create!(title:"Event #{event}", description:"asdfasdfadfaasdf", location:"Bottega", user_id:1, time:Date.today)
end


puts "100 events created"
