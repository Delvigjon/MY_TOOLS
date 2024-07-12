require "faker"
require "open-uri"

# Clear existing data
ToolsCategory.destroy_all
Category.destroy_all
Booking.destroy_all
Tool.destroy_all
User.destroy_all

# Create Categories
categories = {
  jardinage: { name: "Jardinage", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720702489/jardinage_ti3i6t.png" },
  nettoyage: { name: "Nettoyage", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720702493/nettoyage_r3rf12.jpg" },
  bricolage: { name: "Bricolage", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720702490/bricolage_vhdmar.jpg" },
  vehicule: { name: "Véhicule", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720702487/ve%CC%81hicule_bipxdj.jpg" }
}

categories.each do |key, value|
  category = Category.create!(name: value[:name])
  file = URI.open(value[:image_url])
  category.image.attach(io: file, filename: "#{key}.png", content_type: "image/png")
  category.save!
end

# Create Users
users = [
  { name: "Fred", email: "fredesousa7@gmail.com", password: 'password', image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png" },
  { name: "Amael", email: "amael.lathes@gmail.com", password: "password", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png" },
  { name: "Aurélien", email: "larrieu.aurelien@gmail.com", password: "password", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png" },
  { name: "Jonathan", email: "delvigjon@hotmail.fr", password: "password", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png" }
]

users.each do |user_data|
  user = User.create!(name: user_data[:name], email: user_data[:email], password: user_data[:password])
  file = URI.open(user_data[:image_url])
  user.image.attach(io: file, filename: "avatar.png", content_type: "image/png")
  user.save!
end

# Create Tools
tools = [
  { name: "Marteau", description: "Outil de frappe", city: "Lyon", user: User.find_by(name: "Fred"), image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/marteau_omcxni.png" },
  { name: "Scie", description: "Outil de découpe", city: "Paris", user: User.find_by(name: "Amael"), image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617020/scie_xzzqe8.png" },
  { name: "Tournevis", description: "Outil de vissage", city: "Bordeaux", user: User.find_by(name: "Aurélien"), image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/tournvis_pxcsme.png" },
  { name: "Perceuse", description: "Outil de perçage", city: "Reims", user: User.find_by(name: "Jonathan"), image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617016/viceuse_pwm13v.png" }
]

tools.each do |tool_data|
  tool = Tool.create!(name: tool_data[:name], description: tool_data[:description], city: tool_data[:city], user: tool_data[:user])
  file = URI.open(tool_data[:image_url])
  tool.image.attach(io: file, filename: "#{tool_data[:name].downcase}.png", content_type: "image/png")
  tool.save!
  ToolsCategory.create!(tool: tool, category: Category.find_by(name: "Bricolage"))
end

# Create Bookings
bookings = [
  { status: "En attente", user: User.find_by(name: "Fred"), tool: Tool.find_by(name: "Marteau"), start_date: "2024-06-15", end_date: "2024-06-18", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/marteau_omcxni.png" },
  { status: "En attente", user: User.find_by(name: "Amael"), tool: Tool.find_by(name: "Scie"), start_date: "2024-06-15", end_date: "2024-06-18", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617020/scie_xzzqe8.png" },
  { status: "En attente", user: User.find_by(name: "Aurélien"), tool: Tool.find_by(name: "Tournevis"), start_date: "2024-06-15", end_date: "2024-06-18", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/tournvis_pxcsme.png" },
  { status: "En attente", user: User.find_by(name: "Jonathan"), tool: Tool.find_by(name: "Perceuse"), start_date: "2024-06-15", end_date: "2024-06-18", image_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1720617016/viceuse_pwm13v.png" }
]

bookings.each do |booking_data|
  booking = Booking.create!(status: booking_data[:status], user: booking_data[:user], tool: booking_data[:tool], start_date: booking_data[:start_date], end_date: booking_data[:end_date])
  file = URI.open(booking_data[:image_url])
  booking.image.attach(io: file, filename: "#{booking_data[:tool].name.downcase}.png", content_type: "image/png")
  booking.save!
end
