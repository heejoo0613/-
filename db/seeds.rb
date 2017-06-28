admin = User.create(:email => 'heejoo@gmail.com', :password => 'heejoo')
admin.add_role :admin
admin.save

user = User.create(email: 'user@gmail.com', password: '1234')
#아마 after_create 에서 자동으로 user권한을 추가 시킬 겁니다!
user.save

5.times do
    Post.create(
        title: Faker::Name.first_name,
        content: Faker::Lorem.paragraph,
        user: admin)
    Post.create(
        title: Faker::Name.first_name,
        content: Faker::Lorem.paragraph,
        user: admin)
end