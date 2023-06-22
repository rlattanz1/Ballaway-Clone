require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Product.destroy_all
    # Review.destroy_all
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    # ApplicationRecord.connection.reset_pk_sequence!('reviews')

    # puts "Creating demo user..." for when I have my demo user button set up tonight
    # User.create!(
    #   username: 'Demo-lition',
    #   email: 'demo@user.io',
    #   first_name: 'Demo',
    #   last_name: 'User',
    #   password: 'password'
    # )
    # puts "done creating demo user"
    # puts ""

    # puts "Creating users..."
    # # More users
    # 10.times do
    #   User.create!({
    #     username: Faker::Internet.unique.username(specifier: 3),
    #     email: Faker::Internet.unique.email,
    #     first_name: Faker::Name.first_name,
    #     last_name: Faker::Name.last_name,
    #     password: 'password'
    #   })
    # end
    # puts "done creating users"
    # puts ""


    puts "Creating products..."

    p1 = Product.create!({
        name: "Paradym Driver",
        description: "The Paradym driver model provides a refined shape with high MOI and adjustable perimeter weighting. Engineered for players of all skill levels, this club promotes high launch and low spin characteristics along with a neutral ball flight. It is our best combination of distance, forgiveness, and adjustability.",
        price: 599,
        category: "Driver",
        specs: "9°, RH / LH, 45.75\", 57.0°, 460"
      })

      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-1.webp'), filename: 'paradym-1.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-2.webp'), filename: 'paradym-2.webp')

    p2 = Product.create!({
        name: "Paradym X Driver",
        description: "The Paradym X Driver is built for a high launch with high MOI, along with a generously stretched profile at address. This model is best suited for golfers seeking extreme forgiveness and a slight draw bias from their driver.",
        price: 599,
        category: "Driver",
        specs: "9°, RH / LH, 45.75\", 60.0°, 460"
      })

      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-td-1.webp'), filename: 'paradym-td-1.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-td-2.webp'), filename: 'paradym-td-2.webp')

    p3 = Product.create!({
        name: "Paradym Triple Diamond Driver",
        description: "TThe Paradym Triple Diamond Driver is a compact, 450cc shape designed for better players who want to work the ball. It is the lowest spinning and lowest launching Paradym model with a neutral ball flight.",
        price: 599,
        category: "Driver",
        specs: "9°, RH / LH, 45.75\", 57.0°, 450"
      })

      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-x-1.webp'), filename: 'paradym-x-1.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-x-2.webp'), filename: 'paradym-x-2.webp')
