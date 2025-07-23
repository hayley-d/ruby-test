# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all


User.create!([
               {
                 name: "Geralt",
                 last_name: "of Rivia",
                 mobile: "0812345678",
                 age: 100,
                 email: "geralt@witchers.org"
               },
               {
                 name: "Yennefer",
                 last_name: "of Vengerberg",
                 mobile: "0823456789",
                 age: 99,
                 email: "yennefer@sorceress.net"
               },
               {
                 name: "Ciri",
                 last_name: "of Cintra",
                 mobile: "0834567890",
                 age: 21,
                 email: "ciri@elderblood.org"
               },
               {
                 name: "Triss",
                 last_name: "Merigold",
                 mobile: "0845678901",
                 age: 35,
                 email: "triss@mages.edu"
               },
               {
                 name: "Dandelion",
                 last_name: "Poet",
                 mobile: "0856789012",
                 age: 40,
                 email: "dandelion@bardmail.com"
               },
               {
                 name: "Vesemir",
                 last_name: "Old Wolf",
                 mobile: "0867890123",
                 age: 150,
                 email: "vesemir@kaermorhen.com"
               }
             ])
p "Created #{User.count} Users"

Doctor.destroy_all
Doctor.create!([
                 {
                   name: "Elrond Half-elven",
                   active: true
                 },
                 {
                   name: "Gandalf the Grey",
                   active: true
                 },
                 {
                   name: "Arwen Undómiel",
                   active: false
                 },
                 {
                   name: "Radagast the Brown",
                   active: true
                 },
                 {
                   name: "Galadriel of Lothlórien",
                   active: false
                 },
                 {
                   name: "Saruman the White",
                   active: false
                 }
               ])

p "Created #{Doctor.count} Doctors"

Pet.destroy_all

geralt    = User.find_by(name: "Geralt")
yennefer  = User.find_by(name: "Yennefer")
ciri      = User.find_by(name: "Ciri")
triss     = User.find_by(name: "Triss")
dandelion = User.find_by(name: "Dandelion")
vesemir   = User.find_by(name: "Vesemir")

Pet.create!([
              {
                name: "Roach",
                species: "Horse",
                user: geralt
              },
              {
                name: "Lilac",
                species: "Cat",
                user: yennefer
              },
              {
                name: "Zireael",
                species: "Wolf Pup",
                user: ciri
              },
              {
                name: "Ember",
                species: "Phoenix",
                user: triss
              },
              {
                name: "Lute",
                species: "Parrot",
                user: dandelion
              },
              {
                name: "Griffin",
                species: "Wolf",
                user: vesemir
              }
            ])
p "Created #{Pet.count} Pets"

Bank.destroy_all
Bank.create!([
               {
                 name: "Bank of Gondor"
               },
               {
                 name: "Shire Savings & Loan"
               },
               {
                 name: "Mordor Vaults"
               },
               {
                 name: "Rivendell Credit Union"
               },
               {
                 name: "Minas Tirith Treasury"
               },
               {
                 name: "Erebor Gold Reserve"
               }
             ])
p "Created #{Bank.count} Banks"
