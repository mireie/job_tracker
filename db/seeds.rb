User.destroy_all
FactoryBot.create(:admin)
FactoryBot.create_list(:user_with_jobs, 25)
FactoryBot.create_list(:job, 25, user: User.first)
puts "Seed Successful."