# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password_digest: 'test123')

#for create faq categories data
faq_category_titles = ["Returns", "Payment Methods", "Delivery", "Exchanges & Returns", "Registration", "Contacts", "Wheat Flour", "Powdered Spices"]

faq_category_titles.each do |title|
  FaqCategory.find_or_create_by(title: title)
end

#for create about Us data
about_us_titles = ["Returns", "How to initiate a return", "Return Eligibility", "How to initiate a return", "About Us"]

about_us_titles.uniq.each do |title|
  AboutUs.find_or_create_by(title: title)
end

#create_corresponding_faq_category
Category.find_each do |category|
    FaqCategory.find_or_create_by(title: category.name)
end

#for create banner data

banners = [
  { title: "Harvested with Care, Ground with Passion", text_color: "#d34a4a", banner_type: "banner" },
  { title: "Harvested Ground Passion", text_color: "#24d662", banner_type: "banner" },
  { title: "Elevate Morning With 100%, Unpolished Daliya", text_color: "#000000", banner_type: "banner" },
  { title: "Create your own Coffee Club subscription and curate your plan", text_color: "#000000", banner_type: "advertise" },
  { title: "Create your own Coffee Club subscription and curate your plan", text_color: "#000000", banner_type: "advertise" },
  { title: "Create your own Coffee Club subscription and curate your plan", text_color: "#000000", banner_type: "advertise" },
  { title: "Create your own Coffee Club subscription and curate your plan", text_color: "#000000", banner_type: "advertise" },
  { title: "Create your own Coffee Club subscription and curate your plan, picking exactly what you want and when to receive it. No stress, just great coffee.", text_color: "#000000", banner_type: "promotion" },
  { title: "Elevate Morning With 100%, Unpolished Daliya", text_color: "#faf5f5", banner_type: "banner" }
]

banners.each do |banner_params|
  Banner.find_or_create_by(title: banner_params[:title]) do |banner|
    banner.update(banner_params)
  end
end