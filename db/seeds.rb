# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

ToolsCategory.destroy_all
Category.destroy_all
Tool.destroy_all
User.destroy_all

fred = User.create!(
  name: "Fred",
  email: "fredesousa7@gmail.com",
  password: 'password'
)

amael = User.create!(
  name: "Amael",
  email: "amael.lathes@gmail.com",
  password: "password"
)

aurelien = User.create!(
  name: "Aurélien",
  email: "larrieu.aurelien@gmail.com",
  password: "password"
)

jonathan = User.create!(
  name: "Jonathan",
  email: "delvigjon@hotmail.fr",
  password: "password"
)

jardinage = Category.create!(
  name: "Jardinage"
)

nettoyage = Category.create!(
  name: "Nettoyage"
)

bricolage = Category.create!(
  name: "Bricolage"
)

vehicule = Category.create!(
  name: "Vehicule"
)

marteau = Tool.create!(
  name: "Marteau",
  description: "Sert à clouer",
  city: "Lyon",
  user: fred
)

scie = Tool.create!(
  name: "Scie",
  description: "Sert à scier",
  city: "Paris",
  user: amael
)

tournevis = Tool.create!(
  name: "Tournevis",
  description: "Sert à visser",
  city: "Bordeau",
  user: aurelien
)

perceuse = Tool.create!(
  name: "Perceuse",
  description: "Sert à percer",
  city: "Reims",
  user: jonathan
)

ToolsCategory.create!(
  tool: marteau,
  category: bricolage
)

ToolsCategory.create!(
  tool: scie,
  category: bricolage
)

ToolsCategory.create!(
  tool: tournevis,
  category: bricolage
)

ToolsCategory.create!(
  tool: perceuse,
  category: bricolage
)
