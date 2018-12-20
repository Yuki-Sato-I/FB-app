# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  name: "admin",
  email: "as@as.as",
  password:              "password",
  password_confirmation: "password"
)


100.times do |a|
  message = "こんにちは"
  message += "こんにちは"
  Post.create(
    title: "タイトル#{a}",
    content: message,
    user_id: 16
  )
end