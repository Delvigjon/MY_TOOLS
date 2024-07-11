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

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720702489/jardinage_ti3i6t.png")
jardinage.image.attach(io: file, filename: "jardinage.png", content_type: "image/png")
jardinage.save!

nettoyage = Category.create!(name: "Nettoyage")

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720702493/nettoyage_r3rf12.jpg")
nettoyage.image.attach(io: file, filename: "nettoyage.png", content_type: "image/png")
nettoyage.save!

bricolage = Category.create!(name: "Bricolage")

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720702490/bricolage_vhdmar.jpg")
bricolage.image.attach(io: file, filename: "bricolage.png", content_type: "image/png")
bricolage.save!

vehicule = Category.create!(name: "Véhicule")

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720702487/ve%CC%81hicule_bipxdj.jpg")
vehicule.image.attach(io: file, filename: "vehicule.png", content_type: "image/png")
vehicule.save!

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

marteau_booking = Booking.create!(
  status: "En attente",
  user: fred,
  tool: marteau,
  start_date: "2024-06-15",
  end_date: "2024-06-18"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/marteau_omcxni.png")
marteau_booking.image.attach(io: file, filename: "marteau.png", content_type: "image/png")
marteau_booking.save!

scie_booking = Booking.create!(
  status: "En attente",
  user: amael,
  tool: scie,
  start_date: "2024-06-15",
  end_date: "2024-06-18"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617020/scie_xzzqe8.png")
scie_booking.image.attach(io: file, filename: "scie.png", content_type: "image/png")
scie_booking.save!

tournevis_booking = Booking.create!(
  status: "En attente",
  user: aurelien,
  tool: tournevis,
  start_date: "2024-06-15",
  end_date: "2024-06-18"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617015/tournvis_pxcsme.png")
tournevis_booking.image.attach(io: file, filename: "tournvis.png", content_type: "image/png")
tournevis_booking.save!

perceuse_booking = Booking.create!(
  status: "En attente",
  user: jonathan,
  tool: perceuse,
  start_date: "2024-06-15",
  end_date: "2024-06-18"
)

file = URI.open("https://res.cloudinary.com/du3ec0enc/image/upload/v1720617016/viceuse_pwm13v.png")
perceuse_booking.image.attach(io: file, filename: "viceuse.png", content_type: "image/png")
perceuse_booking.save!
