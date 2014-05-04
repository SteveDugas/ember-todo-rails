# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = Tag.create [{ name: "Foo"}, {name: "Bar"}]
group = Group.create(name: "Test Group")
Todo.create(title: "Do some stuff", details: "These are some kickass details my dudes.", due: 5.days.from_now, group: group, tags: tags)
Todo.create(title: "Do some more stuff", details: "Some more details for you guys", due: 4.days.from_now, group: group, tags: tags)
