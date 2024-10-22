FactoryBot.define do
  factory :account do
    fname = Faker::Name.first_name
    lname = Faker::Name.last_name

    email { Faker::Internet.email(name: "#{fname} #{lname}") }
    firs_name { fname }
    last_name { lname }
    status { "active" }
    headline { Faker::Job.title }
  end
end
