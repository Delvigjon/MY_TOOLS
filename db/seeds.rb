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

User.create(
  name: "Fred",
  email: "fredesousa7@gmail.com",
  password: 'password'
)

User.create(
  name: "Amael",
  email: "amael.lathes@gmail.com",
  password: "password"
)

User.create(
  name: "Aurélien",
  email: "larrieu.aurelien@gmail.com",
  password: "password"
)

User.create(
  name: "Jonathan",
  email: "delvigjon@hotmail.fr",
  password: "password"
)

Category.create(
  name: "Jardinage"
)

Category.create(
  name: "Nettoyage"
)

Category.create(
  name: "Bricolage"
)

Category.create(
  name: "Vehicule"
)
