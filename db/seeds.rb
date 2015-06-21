# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.create(name: '学年', category: 'base_groups')
Group.find_by(category: 'base_groups').children.create(name: '4年', category: 'base_group')
Group.find_by(category: 'base_groups').children.create(name: 'M1', category: 'base_group')
Group.find_by(category: 'base_groups').children.create(name: 'M2', category: 'base_group')
