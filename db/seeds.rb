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

elrond = Doctor.find_by(name: "Elrond Half-elven")
gandalf = Doctor.find_by(name: "Gandalf the Grey")
arwen = Doctor.find_by(name: "Arwen Undómiel")
radagast = Doctor.find_by(name: "Radagast the Brown")
gladriel = Doctor.find_by(name: "Gladriel of Lothlórien")
saruman = Doctor.find_by(name: "Saruman the White")

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

Address.destroy_all
Address.create!([
                  {
                    street: "123 Kaer Morhen Trail",
                    user: geralt
                  },
                  {
                    street: "42 Vengerberg Way",
                    user: yennefer
                  },
                  {
                    street: "88 Cintra Crescent",
                    user: ciri
                  },
                  {
                    street: "19 Aretuza Avenue",
                    user: triss
                  },
                  {
                    street: "7 Bard's Lane",
                    user: dandelion
                  },
                  {
                    street: "1 Wolf School Road",
                    user: vesemir
                  }
                ])
p "Created #{Address.count} Addresses"

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

gondor_bank = Bank.find_by(name: "Bank of Gondor")
shire_bank = Bank.find_by(name: "Shire Savings & Loan")
mordor_bank = Bank.find_by(name: "Mordor Vaults")
riven_bank = Bank.find_by(name: "Rivendell Credit Union")
minas_bank   = Bank.find_by(name: "Minas Tirith Treasury")
erebor_bank = Bank.find_by(name: "Erebor Credit Union")

BankAccount.destroy_all
BankAccount.create!([
                      {
                        user: geralt,
                        bank: gondor_bank,
                        account_number: "123456789",
                        card_type: "visa",
                        card_name: "Geralt R"
                      },
                      {
                        user: yennefer,
                        bank: mordor_bank,
                        account_number: "123456781",
                        card_type: "visa",
                        card_name: "Yennefer V"
                      },
                      {
                        user: ciri,
                        bank: minas_bank,
                        account_number: "123456782",
                        card_type: "visa",
                        card_name: "Ciri C"
                      },
                      {
                        user: dandelion,
                        bank: shire_bank,
                        account_number: "123456783",
                        card_type: "visa",
                        card_name: "Dandelion L"
                      },
                      {
                        user: triss,
                        bank: riven_bank,
                        account_number: "123456784",
                        card_type: "visa",
                        card_name: "Triss M"
                      },
                      {
                        user: vesemir,
                        bank: riven_bank,
                        account_number: "123456785",
                        card_type: "visa",
                        card_name: "Vesemir O"
                      },
                    ])

Appointment.destroy_all
Appointment.create!([
                      {
                        date: "2025-03-20",
                        user: geralt,
                        doctor: saruman
                      },
                      {
                        date: "2025-04-25",
                        user: yennefer,
                        doctor: arwen
                      },
                      {
                        date: "2025-06-20",
                        user: ciri,
                        doctor: gladriel
                      },
                      {
                        date: "2025-03-15",
                        user: triss,
                        doctor: elrond
                      },
                      {
                        date: "2025-07-05",
                        user: vesemir,
                        doctor: arwen
                      },
                      {
                        date: "2025-09-13",
                        user: yennefer,
                        doctor: gandalf
                      }
                    ])
p "Created #{Appointment.count} Appointments"
