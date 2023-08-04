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
    Review.destroy_all
    Product.destroy_all
    User.destroy_all
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')

    puts "Creating demo user..."
    User.create!(
      username: 'Demo-user',
      email: 'demo@user.io',
      password: 'password'
    )
    puts "done creating demo user"
    puts ""

    puts "Creating users..."
    # More users for testing
    2.times do
      User.create!({
        username: Faker::Internet.unique.username(specifier: 5),
        email: Faker::Internet.unique.email,
        password: 'password'
      })
    end

    puts "done creating users"
    puts ""


    puts "Creating products..."

    p1 = Product.create!({
        name: "Paradym Driver",
        description: "The Paradym driver model provides a refined shape with high MOI and adjustable perimeter weighting. Engineered for players of all skill levels, this club promotes high launch and low spin characteristics along with a neutral ball flight. It is our best combination of distance, forgiveness, and adjustability.",
        price: 599,
        category: "Driver, Clubs, Featured, Paradym",
        specs: "9°, RH / LH, 45.75\", 57.0°"
      })

      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-1.webp'), filename: 'paradym-1.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-2.webp'), filename: 'paradym-2.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-3.webp'), filename: 'paradym-3.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-4.webp'), filename: 'paradym-4.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-5.webp'), filename: 'paradym-5.webp')
      p1.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-6.webp'), filename: 'paradym-6.webp')

    p2 = Product.create!({
        name: "Paradym X Driver",
        description: "The Paradym X Driver is built for a high launch with high MOI, along with a generously stretched profile at address. This model is best suited for golfers seeking extreme forgiveness and a slight draw bias from their driver.",
        price: 599,
        category: "Driver, Clubs, Paradym",
        specs: "9°, RH / LH, 45.75\", 60.0°"
      })
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-x-1.webp'), filename: 'paradym-x-1.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-x-2.webp'), filename: 'paradym-x-2.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-x-3.webp'), filename: 'paradym-x-3.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-x-4.webp'), filename: 'paradym-x-4.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-x-5.webp'), filename: 'paradym-x-5.webp')
      p2.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-x-6.webp'), filename: 'paradym-x-6.webp')


      p3 = Product.create!({
        name: "Paradym Triple Diamond Driver",
        description: "The Paradym Triple Diamond Driver is a compact, 450cc shape designed for better players who want to work the ball. It is the lowest spinning and lowest launching Paradym model with a neutral ball flight.",
        price: 599,
        category: "Driver, Clubs, Featured, Paradym",
        specs: "9°, RH / LH, 45.75\", 57.0°"
      })

      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-td-1.webp'), filename: 'paradym-td-1.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/paradym-td-2.webp'), filename: 'paradym-td-2.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-td-3.webp'), filename: 'paradym-td-3.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-td-4.webp'), filename: 'paradym-td-4.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-td-5.webp'), filename: 'paradym-td-5.webp')
      p3.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-paradym-td-6.webp'), filename: 'paradym-td-6.webp')

      p4 = Product.create!({
          name: "Paradym Iron",
          description: "Our Paradym Irons combine our A.I. Designed Forged 455 Face with the all-new Speed Frame. They\'re designed for golfers who are looking for a players\' distance iron with a refined shape and premium forging.",
          price: 200,
          category: "Iron, Clubs, Featured, Paradym",
          specs: "20°, RH / LH, 38.875\", 61.0°"
        })

        p4.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-1.webp'), filename: 'iron-paradym-1.webp')
        p4.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-paradym-2.webp'), filename: 'irons-paradym-2.webp')
        p4.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-3.webp'), filename: 'irons-paradym-3.webp')
        p4.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-4.webp'), filename: 'irons-paradym-4.webp')
        p4.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-5.webp'), filename: 'irons-paradym-5.webp')

      p5 = Product.create!({
          name: "Paradym X Iron",
          description: "Our Paradym X Irons combine a Forged 455 Face with the all-new Speed Frame, giving you the best of incredibly long distance technologies and premium forged feel.",
          price: 200,
          category: "Iron, Clubs, Featured, Paradym",
          specs: "20°, RH / LH, 38.875\", 61.0°"
        })

        p5.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-x-1.webp'), filename: 'iron-paradym-x-1.webp')
        p5.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-x-2.webp'), filename: 'iron-paradym-x-2.webp')
        p5.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-x-3.webp'), filename: 'iron-paradym-x-3.webp')
        p5.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-x-4.webp'), filename: 'iron-paradym-x-4.webp')
        p5.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/iron-paradym-x-5.webp'), filename: 'iron-paradym-x-5.webp')

      p6 = Product.create!({
          name: "Paradym Hybrid",
          description: "The Paradym Hybrid is for golfers who want a mid-sized, wood-shaped hybrid that\'s long with excellent versatility and control. Our Cutwave Sole design improves the club\'s performance through the turf, making this our most versatile hybrid, and we\'ve adapted our best fairway wood technologies for maximum distance.",
          price: 299,
          category: "Hybrids, Clubs, Paradym",
          specs: "#3, #4, #5"
        })

        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-1.png'), filename: 'hybrids-paradym-1.png')
        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-2.webp'), filename: 'hybrids-paradym-2.webp')
        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-3.png'), filename: 'hybrids-paradym-3.png')
        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-4.webp'), filename: 'hybrids-paradym-4.webp')
        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-5.webp'), filename: 'hybrids-paradym-5.webp')
        p6.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-6.webp'), filename: 'hybrids-paradym-6.webp')

      p7 = Product.create!({
        name: "Paradym X Hybrid",
        description: "The Paradym X model is for golfers who want a full-sized, wood-shaped hybrid that\'s long with excellent versatility and forgiveness. Our Cutwave Sole design improves the club\'s performance through the turf, making this our most versatile hybrid, and we\'ve adapted our best fairway wood technologies for maximum distance.",
        price: 299,
        category: "Hybrids, Clubs, Paradym",
        specs: "#3, #4, #5, #6, #7"
        })

        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-1.webp'), filename: 'hybrids-paradym-x-1.webp')
        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-2.webp'), filename: 'hybrids-paradym-x-2.webp')
        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-3.webp'), filename: 'hybrids-paradym-x-3.webp')
        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-4.webp'), filename: 'hybrids-paradym-x-4.webp')
        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-5.webp'), filename: 'hybrids-paradym-x-5.webp')
        p7.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/hybrids-paradym-x-6.png'), filename: 'hybrids-paradym-x-6.png')

      p8 = Product.create!({
          name: "Paradym Fairway Wood",
          description: "A total Paradym shift in distance and forgiveness, featuring progressive shaping, and our most robust offering that fits a wide range of player types. This is the model for golfers who want a high launching fairway wood with a neutral ball flight.",
          price: 349,
          category: "Woods, Clubs, Paradym",
          specs: "#3, #5, #7, #9, #11"
        })

        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-1.webp'), filename: 'fwoods-paradym-1.webp')
        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-2.webp'), filename: 'fwoods-paradym-2.webp')
        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-3.webp'), filename: 'fwoods-paradym-3.webp')
        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-4.webp'), filename: 'fwoods-paradym-4.webp')
        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-5.webp'), filename: 'fwoods-paradym-5.webp')
        p8.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-6.webp'), filename: 'fwoods-paradym-6.webp')

        p9 = Product.create!({
          name: "Paradym X Wood",
          description: "A total Paradym shift in distance, these fairway woods will fit players looking for our most forgiving shape with a high launch and a slight draw bias. A Forged Carbon toe patch redistributes weight to the heel to make this fairway easy to turn over.",
          price: 349,
          category: "Woods, Clubs, Paradym",
          specs: "#3, #5, #7"
        })

        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-1.png'), filename: 'fwoods-paradym-x-1.png')
        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-2.png'), filename: 'fwoods-paradym-x-2.png')
        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-3.png'), filename: 'fwoods-paradym-x-3.png')
        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-4.png'), filename: 'fwoods-paradym-x-4.png')
        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-5.png'), filename: 'fwoods-paradym-x-5.png')
        p9.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-x-6.png'), filename: 'fwoods-paradym-x-6.png')


      p10 = Product.create!({
          name: "Paradym Triple Diamond Fairway Wood",
          description: "A total Paradym shift in distance, the Triple Diamond model is our most compact fairway wood shape with a deeper face at address. This offering is best suited for stronger players who are looking for a penetrating ball flight with lower spin.",
          price: 349,
          category: "Woods, Clubs, Paradym",
          specs: "#3, #5"
        })

        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-1.webp'), filename: 'fwoods-paradym-td-1.webp')
        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-2.webp'), filename: 'fwoods-paradym-td-2.webp')
        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-3.webp'), filename: 'fwoods-paradym-td-3.webp')
        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-4.webp'), filename: 'fwoods-paradym-td-4.webp')
        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-5.webp'), filename: 'fwoods-paradym-td-5.webp')
        p10.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fwoods-paradym-td-6.webp'), filename: 'fwoods-paradym-td-6.webp')

      p11 = Product.create!({
          name: "Big Bertha Driver",
          description: "Big Bertha is one of the most iconic names in golf, providing game-changing performance and making the game more fun for players of all abilities. Our new Big Bertha Driver is especially designed with an ultra-low, forward CG for players who want to reduce their slice for straight distance and an easy launch. From the generous profile to the high-strength XL face, these drivers are built for more confidence and for players to find more fairways.",
          price: 499,
          category: "Drivers, Clubs, Bertha",
          specs: "9°, 10.5°, 12.5°"
        })

        p11.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-big-bertha-1.png'), filename: 'drivers-big-bertha-1.png')
        p11.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-big-bertha-2.png'), filename: 'drivers-big-bertha-2.png')
        p11.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-big-bertha-3.png'), filename: 'drivers-big-bertha-3.png')
        p11.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-big-bertha-4.png'), filename: 'drivers-big-bertha-4.png')
        p11.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/drivers-big-bertha-5.png'), filename: 'drivers-big-bertha-5.png')

      # p12 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p12.photos.attach(io: URI.open(''), filename: '')
      #   p12.photos.attach(io: URI.open(''), filename: '')

      # p13 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p13.photos.attach(io: URI.open(''), filename: '')
      #   p13.photos.attach(io: URI.open(''), filename: '')

      # p14 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p14.photos.attach(io: URI.open(''), filename: '')
      #   p14.photos.attach(io: URI.open(''), filename: '')

      # p15 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p15.photos.attach(io: URI.open(''), filename: '')
      #   p15.photos.attach(io: URI.open(''), filename: '')

      # p16 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p16.photos.attach(io: URI.open(''), filename: '')
      #   p16.photos.attach(io: URI.open(''), filename: '')

      # p17 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p17.photos.attach(io: URI.open(''), filename: '')
      #   p17.photos.attach(io: URI.open(''), filename: '')

      # p18 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p18.photos.attach(io: URI.open(''), filename: '')
      #   p18.photos.attach(io: URI.open(''), filename: '')

      # p19 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p19.photos.attach(io: URI.open(''), filename: '')
      #   p19.photos.attach(io: URI.open(''), filename: '')

      # p20 = Product.create!({
      #     name: "",
      #     description: "",
      #     price: ,
      #     category: "",
      #     specs: ""
      #   })

      #   p20.photos.attach(io: URI.open(''), filename: '')
      #   p20.photos.attach(io: URI.open(''), filename: '')


      p21 = Product.create!({
          name: "Fairway C Stand Bag",
          description: "The compact, sleek and stylish Fairway C is ready for every round and easily accommodates all of your golf essentials.",
          price: 249,
          category: "Bags, Gear",
          specs: "none"
        })

        p21.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-1.png'), filename: 'fairway-c-1.png')
        p21.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-2.png'), filename: 'fairway-c-2.png')
        p21.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-3.png'), filename: 'fairway-c-3.png')
        p21.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-4.png'), filename: 'fairway-c-4.png')

        p22 = Product.create!({
          name: "Chev Stand Bag",
          description: "Stand Bag",
          price: 249,
          category: "Bags, Gear",
          specs: "none"
        })

        p22.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-chev-1.png'), filename: 'bags-chev-1.png')
        p22.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-chev-2.png'), filename: 'bags-chev-2.png')
        p22.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-chev-3.png'), filename: 'bags-chev-3.png')
        p22.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-chev-4.png'), filename: 'bags-chev-4.png')

      p23 = Product.create!({
          name: "Fairway C HD Stand Bag",
          description: "Stand Bag",
          price: 249,
          category: "Bags, Gear",
          specs: "none"
        })

        p23.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-c-hd-1.webp'), filename: 'bags-fairway-c-hd-1.webp')
        p23.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-c-hd-2.png'), filename: 'bags-fairway-c-hd-2.png')
        p23.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-c-hd-3.png'), filename: 'bags-fairway-c-hd-3.png')
        p23.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-c-hd-4.png'), filename: 'bags-fairway-c-hd-4.png')

      p24 = Product.create!({
          name: "Fairway + Stand Bag",
          description: "Stand Bag",
          price: 249,
          category: "Bags, Gear",
          specs: "none"
        })

        p24.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-plus-1.png'), filename: 'bags-fairway-plus-1.png')
        p24.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-plus-2.webp'), filename: 'bags-fairway-plus-2.webp')
        p24.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-plus-3.webp'), filename: 'bags-fairway-plus-3.webp')
        p24.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-fairway-plus-4.webp'), filename: 'bags-fairway-plus-4.webp')

      p25 = Product.create!({
          name: "Paradym Fairway 14 Stand Bag",
          description: "Stand Bag",
          price: 249,
          category: "Bags, Gear, Paradym",
          specs: "none"
        })

        p25.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-paradym-fairway-14-1.webp'), filename: 'bags-paradym-fairway-14-1.webp')
        p25.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-paradym-fairway-14-2.webp'), filename: 'bags-paradym-fairway-14-2.webp')
        p25.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-paradym-fairway-14-3.webp'), filename: 'bags-paradym-fairway-14-3.webp')
        p25.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-paradym-fairway-14-4.webp'), filename: 'bags-paradym-fairway-14-4.webp')

      p26 = Product.create!({
          name: "Hyperlite Zero Stand Bag",
          description: "The NEW gold standard in ultra-lightweight stand bags, Hyperlite Zero continues to raise the bar in lightweight performance. An all-new rubberized Shaft Shield™ top provides protection against club shaft wear over time and creates more space for easy club access. Anatomic straps form to your shoulders and are paired with an oversized hip pad delivering a highly comfortable carry. Updated ripstop material saves weight while maintaining durability. Hyperlite Zero exceeds in playability and organization for a bag that only weighs three pounds.",
          price: 279,
          category: "Bags, Gear",
          specs: "none"
        })

        p26.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-hyper-lite-zero-1.webp'), filename: 'bags-hyper-lite-zero-1.webp')
        p26.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-hyper-lite-zero-2.webp'), filename: 'bags-hyper-lite-zero-2.webp')
        p26.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-hyper-lite-zero-3.webp'), filename: 'bags-hyper-lite-zero-3.webp')
        p26.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/bags-hyper-lite-zero-4.webp'), filename: 'bags-hyper-lite-zero-4.webp')

      p27 = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Donut Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. With our proprietary Precision Technology, it\'s longer through the bag while providing the signature soft feel that golfers love. And now it\'s available in a special design to celebrate National Donut Day. Everything is better with donuts, including Chrome Soft.",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p27.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/donut-day-1.png'), filename: 'donut-ball-1.png')
        p27.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/donut-day-2.webp'), filename: 'donut-ball-2.webp')

      p28 = Product.create!({
          name: "Supersoft Matte Orange Golf Balls",
          description: "Matte Orange color",
          price: 49,
          category: "Balls, Supersoft",
          specs: "none"
        })

        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-1.png'), filename: 'balls-supersoft-matte-orange-1.png')
        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-2.png'), filename: 'balls-supersoft-matte-orange-2.png')
        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-3.png'), filename: 'balls-supersoft-matte-orange-3.png')

      p29 = Product.create!({
          name: "Chrome Soft Golf Balls",
          description: "Plain Design",
          price: 49,
          category: "Balls, Chromesoft",
          specs: "none"
        })

        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-2022-chrome-soft-1.webp'), filename: 'balls-2022-chrome-soft-1.webp')
        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-2.png'), filename: 'balls-chrome-soft-2.png')
        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-3.webp'), filename: 'balls-chrome-soft-3.webp')


        p30 = Product.create!({
          name: "Chrome Soft Triple Track Golf Balls",
          description: "TT Design",
          price: 49,
          category: "Balls, Chromesoft",
          specs: "none"
        })

        p30.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-triple-track-1.png'), filename: 'balls-chrome-soft-triple-track-1.png')
        p30.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-triple-track-2.png'), filename: 'balls-chrome-soft-triple-track-2.png')
        p30.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-triple-track-3.png'), filename: 'balls-chrome-soft-triple-track-3.png')
        p30.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-triple-track-4.png'), filename: 'balls-chrome-soft-triple-track-4.png')

        p31 = Product.create!({
          name: "Limited Edition Chrome Soft Oddysey Swirl Golf Balls",
          description: "OS Design",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p31.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-ody-swirl-1.png'), filename: 'balls-chrome-soft-ody-swirl-1.png')
        p31.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-ody-swirl-2.png'), filename: 'balls-chrome-soft-ody-swirl-2.png')

        p32 = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Dog Paw Golf Balls",
          description: "DP Design",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p32.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-dog-paw-1.webp'), filename: 'balls-chrome-soft-truvis-dog-paw-1.webp')
        p32.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-dog-paw-2.webp'), filename: 'balls-chrome-soft-truvis-dog-paw-2.webp')

        p33 = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Pink Golf Balls",
          description: "MD Design",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p33.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-pink-mothers-day-1.png'), filename: 'balls-chrome-soft-truvis-pink-mothers-day-1.png')
        p33.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-pink-mothers-day-2.png'), filename: 'balls-chrome-soft-truvis-pink-mothers-day-2.png')

        p34 = Product.create!({
          name: "Supersoft Arizona Golf Balls",
          description: "AZ Design",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-1.png'), filename: 'balls-supersoft-geo-arizona-1.png')
        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-2.png'), filename: 'balls-supersoft-geo-arizona-2.png')
        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-3.png'), filename: 'balls-supersoft-geo-arizona-3.png')

        p35 = Product.create!({
          name: "Supersoft California Golf Balls",
          description: "CA Design",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-1.png'), filename: 'balls-supersoft-geo-california-1.png')
        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-2.png'), filename: 'balls-supersoft-geo-california-2.png')
        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-3.png'), filename: 'balls-supersoft-geo-california-3.png')

        p36 = Product.create!({
          name: "Supersoft Hawaii Golf Balls",
          description: "HI Design",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-1.png'), filename: 'balls-supersoft-geo-hawaii-1.png')
        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-2.png'), filename: 'balls-supersoft-geo-hawaii-2.png')
        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-3.png'), filename: 'balls-supersoft-geo-hawaii-3.png')

        p37 = Product.create!({
          name: "Supersoft Las Vegas Golf Balls",
          description: "LV Design",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-1.png'), filename: 'balls-supersoft-geo-vegas-1.png')
        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-2.png'), filename: 'balls-supersoft-geo-vegas-2.pn')
        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-3.png'), filename: 'balls-supersoft-geo-vegas-3.png')

        # p = Product.create!({
        #   name: "",
        #   description: "",
        #   price: ,
        #   category: "",
        #   specs: ""
        # })

        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')

        # p = Product.create!({
        #   name: "",
        #   description: "",
        #   price: ,
        #   category: "",
        #   specs: ""
        # })

        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')

        # p = Product.create!({
        #   name: "",
        #   description: "",
        #   price: ,
        #   category: "",
        #   specs: ""
        # })

        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')



        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')


        puts "done creating products"
        puts ""

        puts "Creating reviews..."

        Review.create!({
          user_id: 1,
          product_id: 1,
          title: 'Great Driver',
          body: 'Wow this is the best driver ever',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 1,
          title: 'Amazing Driver',
          body: 'Wow this is the best driver pretty awesome',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 4
        })
        Review.create!({
          user_id: 3,
          product_id: 1,
          title: 'Super Awesome Amazing Driver',
          body: 'OMG this is the most super awesome amazing driver I\'ve ever used ever',
          rating: 4,
          value: 4,
          quality: 4,
          durability: 4
        })
        Review.create!({
          user_id: 1,
          product_id: 4,
          title: 'best iron',
          body: 'Wow this iron hits like a wood I am shocked',
          rating: 4,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 3,
          product_id: 5,
          title: 'OK bag',
          body: 'it gets the job done but a but overpriced for what it has',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 1,
          product_id: 5,
          title: 'Sweet Balls',
          body: 'These golf balls are the best',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 6,
          title: 'Cool Balls',
          body: 'They look cool and are easily recognizable but they dont travel the belst for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })

        puts "done creating reviews"
        puts ""
