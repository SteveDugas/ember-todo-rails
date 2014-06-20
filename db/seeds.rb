# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group = Group.create(name: "Test Group",sort_order: 0)
group2 = Group.create(name: "Test Group 2",sort_order: 0)
Todo.create(title: "Do some stuff", sort_order: 0, details: "These are some kickass details my dudes.", due: 5.days.from_now, group: group)
Todo.create(title: "Do some more stuff", sort_order: 0, details: "Some more details for you guys", due: 4.days.from_now, group: group2)
Todo.create(title: "Starred item", sort_order: 0, details: "Details about the starred one", due: 2.days.from_now, group: group, starred: true)
Todo.create(title: "Completed item", sort_order: 0, details: "Details about the completed one", due: 4.days.from_now, group: group, completed: true)
