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

        p11.photos.attach(io: URI.open(''), filename: '')
        p11.photos.attach(io: URI.open(''), filename: '')

      p12 = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p12.photos.attach(io: URI.open(''), filename: '')
        p12.photos.attach(io: URI.open(''), filename: '')

      p13 = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p13.photos.attach(io: URI.open(''), filename: '')
        p13.photos.attach(io: URI.open(''), filename: '')

      p14 = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p14.photos.attach(io: URI.open(''), filename: '')
        p14.photos.attach(io: URI.open(''), filename: '')

      p15 = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p15.photos.attach(io: URI.open(''), filename: '')
        p15.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')

      p = Product.create!({
          name: "",
          description: "",
          price: ,
          category: "",
          specs: ""
        })

        p.photos.attach(io: URI.open(''), filename: '')
        p.photos.attach(io: URI.open(''), filename: '')


      p = Product.create!({
          name: "Fairway C Stand Bag",
          description: "The compact, sleek and stylish Fairway C is ready for every round and easily accommodates all of your golf essentials.",
          price: 249,
          category: "Bags, Gear",
          specs: "none"
        })

        p.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-1.png'), filename: 'fairway-c-1.png')
        p.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/fairway-c-2.png'), filename: 'fairway-c-2.png')

      p = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Donut Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. With our proprietary Precision Technology, it\'s longer through the bag while providing the signature soft feel that golfers love. And now it\'s available in a special design to celebrate National Donut Day. Everything is better with donuts, including Chrome Soft.",
          price: 49,
          category: "Balls",
          specs: "none"
        })

        p.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/donut-day-1.png'), filename: 'donut-ball-1.png')
        p.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/donut-day-2.webp'), filename: 'donut-ball-2.webp')



        # p.photos.attach(io: URI.open(''), filename: '')
        # p.photos.attach(io: URI.open(''), filename: '')


        puts "done creating products"
        puts ""

        puts "Creating reviews..."

        # Review.create!({
        #   user_id: 1,
        #   product_id: 1,
        #   title: 'Great Driver',
        #   body: 'Wow this is the best driver ever',
        #   rating: 5
        # })
        # Review.create!({
        #   user_id: 2,
        #   product_id: 1,
        #   title: 'Amazing Driver',
        #   body: 'Wow this is the best driver pretty awesome',
        #   rating: 3
        # })
        # Review.create!({
        #   user_id: 3,
        #   product_id: 1,
        #   title: 'Super Awesome Amazing Driver',
        #   body: 'OMG this is the most super awesome amazing driver I\'ve ever used ever',
        #   rating: 4
        # })
        # Review.create!({
        #   user_id: 1,
        #   product_id: 4,
        #   title: 'best iron',
        #   body: 'Wow this iron hits like a wood I am shocked',
        #   rating: 4
        # })
        # Review.create!({
        #   user_id: 3,
        #   product_id: 5,
        #   title: 'OK bag',
        #   body: 'it gets the job done but a but overpriced for what it has',
        #   rating: 3
        # })
        # Review.create!({
        #   user_id: 1,
        #   product_id: 5,
        #   title: 'Sweet Balls',
        #   body: 'These golf balls are the best',
        #   rating: 5
        # })
        # Review.create!({
        #   user_id: 2,
        #   product_id: 6,
        #   title: 'Cool Balls',
        #   body: 'They look cool and are easily recognizable but they dont travel the belst for some reason!',
        #   rating: 3
        # })

        puts "done creating reviews"
        puts ""
