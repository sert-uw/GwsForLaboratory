# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_group = Group.create(name: '管理者', category: 'administrator')

admin = User.create(name: '管理者', email: 'admin@admin.admin', password: 'administrator')
admin.groups << admin_group
admin.save
