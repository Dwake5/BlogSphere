# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
UserPost.destroy_all
Comment.destroy_all

50.times do
    User.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: Faker::Internet.password(10, 20), bio: Faker::Lorem.sentence)
end

150.times do
    Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph_by_chars(10000, false))
end

Post.all.each do |p|
    UserPost.create(user_id: User.all.sample.id, post_id: p.id)
end

100.times do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(100, false), user_id: User.all.sample.id, post_id: Post.all.sample.id)
end
