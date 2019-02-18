i = 1
max = 100
while i <= max  do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    birth_date = Faker::Date.birthday(18, 65)
    u = User.new
    u.birth_date = birth_date
    u.last_name = last_name
    u.first_name = first_name
    u.save
    i+=1
end
