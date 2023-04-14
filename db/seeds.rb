# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# for i in 4..6
#     Route.update(bus_id:2)
# end

# for i in 2..4
#     Route.update(bus_id:2)
# end
# for i in 4..6
#     Route.update(bus_id:3)
# end


for i in 1..5
    Bus.create(name:"Bus-#{i}",number:"MP 04 #{i+1}43",price:300,seats:30,route_id:21)
end

