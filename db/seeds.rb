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

# Seed data for blogs
Blog.find_or_create_by(
  title: "The Art of Baking with Wheat Flour: From Classics to Creative Delights",
  description: "Dive into the heart of the kitchen and embrace the age-old tradition of baking with the golden essence of wheat flour. Uncover the wholesome magic behind crafting rustic loaves of artisanal bread, embark on a quest to master the delicate dance of pie crusts, and infuse your mornings with the aroma of freshly flipped pancakes. Our journey goes beyond the basics, exploring the science and artistry that transforms humble wheat flour into culinary masterpieces.\r\n\r\nWhether you're a seasoned baker or a kitchen adventurer, our blog is a treasure trove of inspiration. From soft and chewy cookies to decadent cakes adorned with silky frosting, we're here to guide you through the sweet symphony of flavors that only wheat flour can offer. Discover the tales of time-tested recipes, learn the tricks of the trade, and unlock the secrets to achieving that perfect rise in your dough.\r\n\r\nJoin us on a flour-dusted exploration where tradition meets innovation, and where every knead, roll, and bake brings a sense of satisfaction and joy. Elevate your baking repertoire, share in the joy of creating, and savor the delicious results that only the art of baking with wheat flour can deliver. Let's turn your kitchen into a haven of creativity and deliciousness!",
)

Blog.find_or_create_by(
  title: "Wheat Flour Wonders: Baking Bliss Unleashed",
  description: "Embark on a culinary adventure with our blog, where wheat flour takes center stage in the enchanting world of baking. From the comforting embrace of warm, homemade bread to the delicate artistry of pastry creation, we invite you to explore the vast possibilities that wheat flour brings to your kitchen.\r\n\r\nUnleash your inner baker as we share not just recipes, but stories woven into the fabric of each floury creation. Whether you're a novice seeking the perfect cookie recipe or an experienced artisan aiming to elevate your skills, our blog is a haven of inspiration. Dive into the alchemy of baking science, uncover the nuances of various wheat flour varieties, and witness the transformative power that turns simple ingredients into extraordinary delights.\r\n\r\nIndulge in the joy of kneading soft, supple doughs, witness the rise of decadent cakes, and savor the aroma of freshly baked wonders. Join us as we celebrate the humble wheat grain, unravel its secrets, and embrace the delicious symphony it orchestrates in our kitchens. Let's journey together into a realm where every sift, fold, and bake brings us closer to the sheer bliss of wheat flour creations. Get ready to awaken your senses and infuse your home with the aroma of pure baking delight!",
)
