FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {'password'}
    password_confirmation {'password'}

    factory :user_with_jobs do
      after(:create) do |user|
        create_list(:job, rand(25), user: user)
      end
    end

    factory :admin do
      first_name { 'Admin' }
      last_name { 'Account' }
      email { 'admin@example.com'}
      password {'password'}
      password_confirmation {'password'}
      admin { true }
    end

  end

  factory :job do
    user { association :user}
    title { Faker::Job.title }
    company { Faker::Company.name }
    url { Faker::Internet.domain_name(domain: "example") }
    cover_letter_url { Faker::Internet.domain_name(domain: "example") }
    resume_url { Faker::Internet.domain_name(domain: "example") }
    submission_date { Faker::Date.between(from: 3.weeks.ago, to: Date.today) }
    created_at { Faker::Date.between(from: 3.weeks.ago, to: Date.today) }
    status { 'Applied' }
    notes {Faker::TvShows::Seinfeld.quote}
  end

end