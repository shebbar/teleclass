# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.find(7)
#user.update_attribute(:admin, true)
user.update_attribute(:activated, true)
user.update_attribute(:activated_at, Time.zone.now)
#user.attributes = {admin: true, activated: true, activated_at: Time.zone.now}
