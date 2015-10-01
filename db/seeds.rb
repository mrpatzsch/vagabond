# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'ffaker'

20.times do
  User.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.email,
    password: FFaker::Internet.password,
    avatar: "http://i1.wp.com/www.techrepublic.com/bundles/techrepubliccore/images/icons/standard/icon-user-default.png"
  ) end

20.times do 
  Tip.create(
    title: FFaker::HipsterIpsum.sentence,
    content: FFaker::HipsterIpsum.paragraph,
    user_id: rand(1..20)
  ) end
