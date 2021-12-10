User.where("RIGHT(last_name::varchar, 5) = '_test'").destroy_all
if !Rails.env.production?
  FactoryBot.create(:admin) if User.find_by(email: 'admin@example.com').nil?
end
FactoryBot.create_list(:user_with_jobs, 25)
puts "Seed Successful."