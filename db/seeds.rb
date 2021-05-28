# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "管理者", email: "admin@test.com", password: "password", admin: true)

cordinate_attributes = Cordinate.new.attributes.keys.map(&:to_sym)
delete_attributes = [:id, :user_id, :created_at, :updated_at]
delete_attributes.each do |delete_attribute|
  cordinate_attributes.delete(delete_attribute)
end

(1..10).each do |n|
  user = User.create!(name: "ユーザー#{n}", email: "user#{n}@test.com", password: "password")
  [*1..3].sample.times do |m|
    data = Faker::Lorem.words(number: 5)
    attributes = Hash[*cordinate_attributes.zip(data).flatten]
    cordinate = user.cordinates.new(attributes)
    cordinate.image.attach(io: File.open("db/fixtures/sample.png"), filename: "#{n}_#{m}_image.jpg")
    cordinate.save!
    sleep(1)
  end
end


    
