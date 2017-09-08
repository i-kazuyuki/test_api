# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Blog.create!(
    title:   "タイトル#{i}",
    content: "ブログの内容#{i}"
  )
end

Comment.create({content: 'comment1', blog_id: 1})
Comment.create({content: 'comment2', blog_id: 1})
Comment.create({content: 'comment3', blog_id: 2})
Comment.create({content: 'comment4', blog_id: 2})

10.times do |i|
  Shop.create!(
    name:   "ショップ名#{i}",
    address: "アドレス#{i}"
  )
end
