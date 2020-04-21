# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ms = Institution.create(name: "Machon Shlomo")

user1= User.create(email: "cleaner@gmail.com", password: "password", password_confirmation: "password", sub_class: "Cleaner")
user2 = User.create(email: "cleaner2@gmail.com", password: "password", password_confirmation: "password", sub_class: "Cleaner")
user3 = User.create(email: "dl29bb@gmail.com", password: "password", password_confirmation: "password", sub_class: "Cleaner")
user4 = User.create(email: "customer@gmail.com", password: "password", password_confirmation: "password", sub_class: "Customer")
user5 = User.create(email: "customer2@gmail.com", password: "password", password_confirmation: "password", sub_class: "Customer")
user6 = User.create(email: "customer3@gmail.com", password: "password", password_confirmation: "password", sub_class: "Customer")

user1.create_cleaner(first_name: "Philip", last_name: "Melnick", phone: "123-456-7980", whatsapp: "098076504321", institution: ms, address: {"neighborhood" => "Har Nof", "city"=> "Jerusalem}"})
user2.create_cleaner(first_name: "Semyon", last_name: "Neys", phone: "123-456-7980", whatsapp: "098076504321", institution: ms, address: {"neighborhood" => "Har Nof", "city"=> "Jerusalem}"})
user3.create_cleaner(first_name: "Donnovan", last_name: "Lyons", phone: "123-456-7980", whatsapp: "098076504321", institution: ms, address: {"neighborhood" => "Har Nof", "city"=> "Jerusalem}"})
user4.create_customer(first_name: "Sandie", last_name: "Freishtat", phone: "123-456-7980", address: {"street_address" => "20 Hakablan", "neighborhood" => "Har Nof", "city"=> "Jerusalem}"})
user5.create_customer(first_name: "Yehoshua", last_name: "Styne", phone: "123-456-7980", address: {"street_address" => "60 Shaulzon", "neighborhood" => "Har Nof", "city"=> "Jerusalem}"})
user6.create_customer(first_name: "Benjamin", last_name: "Surovsky", phone: "123-456-7980", address: {"street_address" => "22 Katzenelenbogen", "neighborhood" => "Har Nof", "city"=> "Jerusalem}"})