User.where("RIGHT(last_name::varchar, 5) = '_test'"
).destroy_all
FactoryBot.create(:admin) if User.find_by(email: 'admin@example.com').nil?
FactoryBot.create_list(:user_with_jobs, 25)
FactoryBot.create_list(:job, 25, user: User.first)
puts "Seed Successful."