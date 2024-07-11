require "faker"
require "open-uri"

# Supprimer toutes les données existantes
ToolsCategory.destroy_all
Category.destroy_all
Booking.destroy_all
Tool.destroy_all
User.destroy_all

# Création des catégories
jardinage = Category.create!(name: "Jardinage")
nettoyage = Category.create!(name: "Nettoyage")
bricolage = Category.create!(name: "Bricolage")
vehicule = Category.create!(name: "Véhicule")

# Création des utilisateurs
fred = User.create!(
  name: "Fred",
  email: "fredesousa7@gmail.com",
  password: 'password'
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png")
fred.image.attach(io: file, filename: "avatar.png", content_type: "image/png")
fred.save!

amael = User.create!(
  name: "Amael",
  email: "amael.lathes@gmail.com",
  password: "password"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png")
amael.image.attach(io: file, filename: "avatar.png", content_type: "image/png")
amael.save!

aurelien = User.create!(
  name: "Aurélien",
  email: "larrieu.aurelien@gmail.com",
  password: "password"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png")
aurelien.image.attach(io: file, filename: "avatar.png", content_type: "image/png")
aurelien.save!

jonathan = User.create!(
  name: "Jonathan",
  email: "delvigjon@hotmail.fr",
  password: "password"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720691993/avatar_m7e7zi.png")
jonathan.image.attach(io: file, filename: "avatar.png", content_type: "image/png")
jonathan.save!

# Création des outils
marteau = Tool.create!(
  name: "Marteau",
  description: "Outil de frappe",
  city: "Lyon",
  user: fred
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/marteau_omcxni.png")
marteau.image.attach(io: file, filename: "marteau.png", content_type: "image/png")
marteau.save!

scie = Tool.create!(
  name: "Scie",
  description: "Outil de découpe",
  city: "Paris",
  user: amael
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617020/scie_xzzqe8.png")
scie.image.attach(io: file, filename: "scie.png", content_type: "image/png")
scie.save!

tournevis = Tool.create!(
  name: "Tournevis",
  description: "Outil de vissage",
  city: "Bordeaux",
  user: aurelien
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/tournvis_pxcsme.png")
tournevis.image.attach(io: file, filename: "tournvis.png", content_type: "image/png")
tournevis.save!

perceuse = Tool.create!(
  name: "Perceuse",
  description: "Outil de perçage",
  city: "Reims",
  user: jonathan
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617016/viceuse_pwm13v.png")
perceuse.image.attach(io: file, filename: "perceuse.png", content_type: "image/png")
perceuse.save!

# Association des outils aux catégories
ToolsCategory.create!(tool: marteau, category: bricolage)
ToolsCategory.create!(tool: scie, category: bricolage)
ToolsCategory.create!(tool: tournevis, category: bricolage)
ToolsCategory.create!(tool: perceuse, category: bricolage)
