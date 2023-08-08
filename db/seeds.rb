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
    15.times do
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
        specs: "9°, 10.5°, 12°"
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
        specs: "9°, 10.5°, 12°"
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
        specs: "9°, 10.5°, 12°"
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
          specs: "#4, #5, #6, #7, #8, #9"
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
          specs: "#4, #5, #6, #7, #8, #9"
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

      p12 = Product.create!({
          name: "Callaway CB Wedge",
          description: "The new Callaway CB Wedge is built to deliver short game forgiveness with incredible spin and feel. From player-friendly shaping, premium feel technologies, and the most aggressive groove in golf, it\'s designed for players who want maximum confidence from their short game.",
          price: 159,
          category: "Wedges, Clubs",
          specs: "48°, 50°, 52°, 54°, 56°, 58°, 60°"
        })

        p12.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-cb-1.png'), filename: 'wedges-cb-1.png')
        p12.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-cb-2.webp'), filename: 'wedges-cb-2.webp')
        p12.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-cb-3.png'), filename: 'wedges-cb-3.png')
        p12.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-cb-4.webp'), filename: 'wedges-cb-4.webp')
        p12.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-cb-5.png'), filename: 'wedges-cb-5.png')

      p13 = Product.create!({
          name: "Jaws Raw Full Face Groove Wedge",
          description: "Jaws Raw brings raw scoring performance to your wedge game. Legendary club designer Roger Cleveland has created a new line that combines artistry and craftsmanship with cutting edge innovation. Now available with grooves across the entire face to bring even more confidence and versatility to your short game. Available in lob wedges with Z, S, & W grinds, Jaws Raw with full face grooves offer a unique option for players looking for spin across the entire hitting area.",
          price: 179,
          category: "Wedges, Clubs",
          specs: "58°, 60°"
        })

        p13.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-full-face-chrome-1.webp'), filename: 'wedges-jaws-raw-full-face-chrome-1.webp')
        p13.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-full-face-chrome-2.webp'), filename: 'wedges-jaws-raw-full-face-chrome-2.webp')
        p13.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-full-face-chrome-3.webp'), filename: 'wedges-jaws-raw-full-face-chrome-3.webp')
        p13.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-full-face-chrome-4.webp'), filename: 'wedges-jaws-raw-full-face-chrome-4.webp')

      p14 = Product.create!({
          name: "Jaws Raw Matte Black Wedge",
          description: "Jaws Raw brings raw scoring performance to your wedge game. Featuring the most aggressive grooves in golf, with a raw face that promotes maximum spin. Callaway is bringing tungsten technology to a wedge, for a weight balanced club that offers both feel and control. Jaws Raw Black Plasma wedges now extend into left-handed options. Available in a full family from 52°, 56° and 60° in the S grind, and spanning each grind S, Z, W, X in the 60°.",
          price: 179,
          category: "Wedges, Clubs",
          specs: "48°, 50°, 52°, 54°, 56°, 58°, 60°"
        })

        p14.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-matte-black-1.webp'), filename: 'wedges-jaws-raw-matte-black-1.webp')
        p14.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-matte-black-2.webp'), filename: 'wedges-jaws-raw-matte-black-2.webp')
        p14.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-matte-black-3.webp'), filename: 'wedges-jaws-raw-matte-black-3.webp')
        p14.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/wedges-jaws-raw-matte-black-4.webp'), filename: 'wedges-jaws-raw-matte-black-4.webp')

      p15 = Product.create!({
          name: "Apex CB Iron",
          description: "The new Apex CB \'24 Irons are designed for the most discerning tour pros and elite ball-strikers. This tour-cavity back is designed with an all-new forged construction for a pure feel, precise shot-making, and workability.",
          price: 200,
          category: "Iron, Clubs, Apex",
          specs: "#4, #5, #6, #7, #8, #9"
        })

        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-1.webp'), filename: 'irons-apex-cb-chrome-1.webp')
        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-2.webp'), filename: 'irons-apex-cb-chrome-2.webp')
        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-3.webp'), filename: 'irons-apex-cb-chrome-3.webp')
        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-4.webp'), filename: 'irons-apex-cb-chrome-4.webp')
        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-5.webp'), filename: 'irons-apex-cb-chrome-5.webp')
        p15.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-cb-chrome-6.webp'), filename: 'irons-apex-cb-chrome-6.webp')

      p16 = Product.create!({
          name: "Apex Pro Iron",
          description: "A revolutionary multi-material forged construction paired with our patented urethane microspheres delivers unmatched feel. An all-new progressive face is designed for exceptional distance with Tour-level precision. And a Dynamic Sole Design promotes improved turf interaction and better contact. The ultimate players performance iron has officially arrived.",
          price: 200,
          category: "Iron, Clubs, Apex",
          specs: "#4, #5, #6, #7, #8, #9"
        })

        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-1.webp'), filename: 'irons-apex-pro-1.webp')
        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-2.webp'), filename: 'irons-apex-pro-2.webp')
        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-3.webp'), filename: 'irons-apex-pro-3.webp')
        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-4.webp'), filename: 'irons-apex-pro-4.webp')
        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-5.webp'), filename: 'irons-apex-pro-5.webp')
        p16.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-pro-6.webp'), filename: 'irons-apex-pro-6.webp')

      p17 = Product.create!({
          name: "Apex Utility Iron",
          description: "The new Apex UT Iron is designed to provide better players a powerful, yet versatile option off the tee when precision is paramount. The 455 forged face cup is engineered to provide exceptional distance while a revolutionary multi-material forged construction paired with our patented urethane microspheres delivers unmatched feel.",
          price: 275,
          category: "Iron, Clubs, Apex",
          specs: "#4, #5, #6, #7, #8, #9"
        })

        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-1.webp'), filename: 'irons-apex-utility-1.webp')
        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-2.webp'), filename: 'irons-apex-utility-2.webp')
        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-3.webp'), filename: 'irons-apex-utility-3.webp')
        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-4.webp'), filename: 'irons-apex-utility-4.webp')
        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-5.webp'), filename: 'irons-apex-utility-5.webp')
        p17.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/irons-apex-utility-6.webp'), filename: 'irons-apex-utility-6.webp')

      p18 = Product.create!({
          name: "Eleven 2 Ball S Putter",
          description: "The 2-Ball Eleven S is a toe hang mallet best suited for golfers with strokes with moderate face rotation and arc. This putter combines our Tour proven 2-Ball and multi-material Eleven shapes, creating a super high MOI head design with our red Stroke Lab shaft and legendary White Hot insert. This putter is equipped with two 15 gram adjustable weights.",
          price: 299,
          category: "Putters, Clubs, Odyssey",
          specs: "none"
        })

        p18.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-eleven-2-ball-slant-1.png'), filename: 'putters-eleven-2-ball-slant-1.png')
        p18.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-eleven-2-ball-slant-2.png'), filename: 'putters-eleven-2-ball-slant-2.png')
        p18.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-eleven-2-ball-slant-3.png'), filename: 'putters-eleven-2-ball-slant-3.png')
        p18.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-eleven-2-ball-slant-4.png'), filename: 'putters-eleven-2-ball-slant-4.png')

      p19 = Product.create!({
          name: "Tri Hot 5K Double Wide Putter",
          description: "The Tri-Hot 5K Double Wide is a wide blade with a crank neck hosel yielding moderate toe hang making it suitable for strokes with moderate swing arc and face rotation. Tri-Hot 5K putters transform the performance of a blade with multi-material front loaded tungsten weighting that improves CG positioning while dramatically increasing inertia. This putter is equipped with two 25 gram adjustable weights.",
          price: 399,
          category: "Putters, Clubs, Odyssey",
          specs: "none"
        })

        p19.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-double-wide-1.png'), filename: 'putters-tri-hot-5k-double-wide-1.png')
        p19.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-double-wide-2.png'), filename: 'putters-tri-hot-5k-double-wide-2.png')
        p19.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-double-wide-3.png'), filename: 'putters-tri-hot-5k-double-wide-3.png')
        p19.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-double-wide-4.png'), filename: 'putters-tri-hot-5k-double-wide-4.png')

      p20 = Product.create!({
          name: "Tri Hot 5K Rossie Putter",
          description: "The Tri-Hot 5K Rossie is a face-balanced double bend mallet suitable for strokes with minimal arc and face rotation. Tri-Hot 5K putters transform putting performance with multi-material front loaded tungsten weighting that improves CG positioning while dramatically increasing inertia. This putter is equipped with two 25 adjustable weights.",
          price: 399,
          category: "Putters, Clubs, Odyssey",
          specs: "none"
        })

        p20.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-rossie-1.png'), filename: 'putters-tri-hot-5k-rossie-1.png')
        p20.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-rossie-2.png'), filename: 'putters-tri-hot-5k-rossie-2.png')
        p20.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-rossie-3.png'), filename: 'putters-tri-hot-5k-rossie-3.png')
        p20.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-tri-hot-5k-rossie-4.png'), filename: 'putters-tri-hot-5k-rossie-4.png')


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
          description: "The NEW Chev offers a sleek and versatile midsized stand bag, featuring updated branding, ample storage and 4-way club organization at an exceptional value.",
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
          description: "A sleek and stylish compact stand bag with waterproof construction, the Fairway C easily accommodates all your golf essentials while keeping the elements out.",
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
          description: "Fairway + bridges the gap between Fairway C and Fairway 14. Featuring our proprietary 4-way Lowrider top with Apex divider system, the Fairway + is light enough to carry or integrates seamlessly with most modern push carts.",
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
          description: "Fairway 14 offers the best of both worlds, combining the organization and size of a cart bag with the portability of a stand bag, and now integrates easily with most pushcarts. Now with Paradym colors.",
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
          description: "Supersoft is one of the most popular balls in golf, particularly for its long, straight distance, and most importantly the super soft feel. We\'ve advanced the cover, core, and construction technologies to enhance these key benefits, with improved performance from tee-to-green, plus an impressive, eye-catching Matte Orange Finish.",
          price: 49,
          category: "Balls, Supersoft",
          specs: "none"
        })

        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-1.png'), filename: 'balls-supersoft-matte-orange-1.png')
        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-2.png'), filename: 'balls-supersoft-matte-orange-2.png')
        p28.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-matte-orange-3.png'), filename: 'balls-supersoft-matte-orange-3.png')

      p29 = Product.create!({
          name: "Chrome Soft Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. Now with our proprietary new Precision Technology, the Chrome Soft Golf Ball is longer through the bag while providing the signature soft feel that golfers love.",
          price: 49,
          category: "Balls, Chromesoft",
          specs: "none"
        })

        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-2022-chrome-soft-1.webp'), filename: 'balls-2022-chrome-soft-1.webp')
        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-2.png'), filename: 'balls-chrome-soft-2.png')
        p29.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-3.webp'), filename: 'balls-chrome-soft-3.webp')


        p30 = Product.create!({
          name: "Chrome Soft Triple Track Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. Now with our proprietary new Precision Technology, the Chrome Soft Golf Ball is longer through the bag while providing the signature soft feel that golfers love, plus our major-winning Triple Track Technology.",
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
          description: "Chrome Soft is better for everyone, from amateurs to major winners. Now with our proprietary new Precision Technology, the Chrome Soft Golf Ball is longer through the bag while providing the signature soft feel that golfers love. And now it\'s available in an iconic Odyssey swirl pattern across the ball to showcase the #1 Putter in Golf.",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p31.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-ody-swirl-1.png'), filename: 'balls-chrome-soft-ody-swirl-1.png')
        p31.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-ody-swirl-2.png'), filename: 'balls-chrome-soft-ody-swirl-2.png')

        p32 = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Dog Paw Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. With our proprietary Precision Technology, it\'s longer through the bag while providing the signature soft feel that golfers love. It\'s better for everyone, and if you\'re a dog person, this limited edition Truvis design is for you!",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p32.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-dog-paw-1.webp'), filename: 'balls-chrome-soft-truvis-dog-paw-1.webp')
        p32.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-dog-paw-2.webp'), filename: 'balls-chrome-soft-truvis-dog-paw-2.webp')

        p33 = Product.create!({
          name: "Limited Edition Chrome Soft Truvis Pink Golf Balls",
          description: "Chrome Soft is better for everyone, from amateurs to major winners. Now with our proprietary new Precision Technology, the Chrome Soft Golf Ball is longer through the bag while providing the signature soft feel that golfers love, along with our popular Truvis hi-res technology.",
          price: 49,
          category: "Balls, Chromesoft, Limited Edition",
          specs: "none"
        })

        p33.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-pink-mothers-day-1.png'), filename: 'balls-chrome-soft-truvis-pink-mothers-day-1.png')
        p33.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-chrome-soft-truvis-pink-mothers-day-2.png'), filename: 'balls-chrome-soft-truvis-pink-mothers-day-2.png')

        p34 = Product.create!({
          name: "Supersoft Arizona Golf Balls",
          description: "Supersoft is one of the most popular balls in golf, particularly for its long, straight distance, super soft feel, and great control in the short game. We\'ve advanced the cover, core, and construction technologies to enhance these key benefits, with improved performance from tee-to-green. Now our limited-edition Geo Collection highlights some of the most popular golf regions across the U.S. with visual features and messages to showcase each region. The Geo Collection is available in 4 unique designs: Arizona, California, Hawaii, Las Vegas.",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-1.png'), filename: 'balls-supersoft-geo-arizona-1.png')
        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-2.png'), filename: 'balls-supersoft-geo-arizona-2.png')
        p34.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-arizona-3.png'), filename: 'balls-supersoft-geo-arizona-3.png')

        p35 = Product.create!({
          name: "Supersoft California Golf Balls",
          description: "Supersoft is one of the most popular balls in golf, particularly for its long, straight distance, super soft feel, and great control in the short game. We\'ve advanced the cover, core, and construction technologies to enhance these key benefits, with improved performance from tee-to-green. Now our limited-edition Geo Collection highlights some of the most popular golf regions across the U.S. with visual features and messages to showcase each region. The Geo Collection is available in 4 unique designs: Arizona, California, Hawaii, Las Vegas.",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-1.png'), filename: 'balls-supersoft-geo-california-1.png')
        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-2.png'), filename: 'balls-supersoft-geo-california-2.png')
        p35.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-california-3.png'), filename: 'balls-supersoft-geo-california-3.png')

        p36 = Product.create!({
          name: "Supersoft Hawaii Golf Balls",
          description: "Supersoft is one of the most popular balls in golf, particularly for its long, straight distance, super soft feel, and great control in the short game. We\'ve advanced the cover, core, and construction technologies to enhance these key benefits, with improved performance from tee-to-green. Now our limited-edition Geo Collection highlights some of the most popular golf regions across the U.S. with visual features and messages to showcase each region. The Geo Collection is available in 4 unique designs: Arizona, California, Hawaii, Las Vegas.",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-1.png'), filename: 'balls-supersoft-geo-hawaii-1.png')
        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-2.png'), filename: 'balls-supersoft-geo-hawaii-2.png')
        p36.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-hawaii-3.png'), filename: 'balls-supersoft-geo-hawaii-3.png')

        p37 = Product.create!({
          name: "Supersoft Las Vegas Golf Balls",
          description: "Supersoft is one of the most popular balls in golf, particularly for its long, straight distance, super soft feel, and great control in the short game. We\'ve advanced the cover, core, and construction technologies to enhance these key benefits, with improved performance from tee-to-green. Now our limited-edition Geo Collection highlights some of the most popular golf regions across the U.S. with visual features and messages to showcase each region. The Geo Collection is available in 4 unique designs: Arizona, California, Hawaii, Las Vegas.",
          price: 49,
          category: "Balls, Supersoft, Geo",
          specs: "none"
        })

        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-1.png'), filename: 'balls-supersoft-geo-vegas-1.png')
        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-2.png'), filename: 'balls-supersoft-geo-vegas-2.pn')
        p37.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/balls-supersoft-geo-vegas-3.png'), filename: 'balls-supersoft-geo-vegas-3.png')

        p38 = Product.create!({
          name: "White Hot Versa Seven DB Putter",
          description: "The White Hot Versa Seven is a double bend face-balanced mallet, best suited for strokes with minimal arc and face rotation. Our black and white high contrast Versa alignment system has dominated on Tours all over the world.",
          price: 249,
          category: "Putters, Clubs, Odyssey",
          specs: "none"
        })

        p38.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-wh-versa-seven-db-1.png'), filename: 'putters-wh-versa-seven-db-1.png')
        p38.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-wh-versa-seven-db-2.png'), filename: 'putters-wh-versa-seven-db-2.png')
        p38.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-wh-versa-seven-db-3.png'), filename: 'putters-wh-versa-seven-db-3.png')
        p38.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/putters-wh-versa-seven-db-4.png'), filename: 'putters-wh-versa-seven-db-4.png')

        p39 = Product.create!({
          name: "OPTI Color Golf Gloves",
          description: "Full premium leather construction, perforated back of hand and fingers for breathability and bright colors make Callaway\'s OPTI Color glove the best choice for performance and fashion.",
          price: 19,
          category: "Gloves, Gear",
          specs: "none"
        })

        p39.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-opticolor-1.png'), filename: 'gloves-opticolor-1.png')
        p39.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-opticolor-2.png'), filename: 'gloves-opticolor-2.png')

        p40 = Product.create!({
          name: "Tour Authentic Golf Gloves",
          description: "NEW! Ultra-Soft Cabretta leather infused with ultra tacky Griptac™ provides unmatched comfort and grip on our Premium, Tour-proven glove.",
          price: 24,
          category: "Gloves, Gear",
          specs: "none"
        })

        p40.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-1.png'), filename: 'gloves-ta-1.png')
        p40.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-2.png'), filename: 'gloves-ta-2.png')

        p41 = Product.create!({
          name: "Tour Authentic American Golf Gloves",
          description: "Ultra-Soft Cabretta leather infused with ultra-tacky Griptac™ provides unmatched comfort and grip on our premium, tour-proven glove. Now with a USA stars and stripes theme.",
          price: 24,
          category: "Gloves, Gear",
          specs: "none"
        })

        p41.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-americana-1.png'), filename: 'gloves-ta-americana-1.png')
        p41.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-americana-2.png'), filename: 'gloves-ta-americana-2.png')

        p42 = Product.create!({
          name: "Tour Authentic Lucky Golf Gloves",
          description: "Add some Luck to your game with the Lucky Tour Authentic glove. Ultra-Soft Cabretta leather infused with ultra tacky Griptac™ provides unmatched comfort and grip on our Premium, Tour-proven glove.",
          price: 24,
          category: "Gloves, Gear",
          specs: "none"
        })

        p42.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-st-paddys-1.webp'), filename: 'gloves-ta-st-paddys-1.webp')
        p42.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-ta-st-paddys-2.webp'), filename: 'gloves-ta-st-paddys-2.webp')

        p43 = Product.create!({
          name: "Weather Span Golf Gloves",
          description: "Proprietary FUSETECH™ synthetic combined with strategically placed leather and micro-ventilation delivers comfort, feel, and fit in a highly-durable glove. Available in single and 2-pack.",
          price: 12,
          category: "Gloves, Gear",
          specs: "none"
        })

        p43.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-weather-spann-1.webp'), filename: 'gloves-weather-spann-1.webp')
        p43.photos.attach(io: URI.open('https://ballaway-seeds.s3.us-west-1.amazonaws.com/gloves-weather-spann-2.png'), filename: 'gloves-weather-spann-2.png')

        # p44 = Product.create!({
        #   name: "",
        #   description: "",
        #   price: ,
        #   category: "",
        #   specs: ""
        # })

        # p44.photos.attach(io: URI.open(''), filename: '')
        # p44.photos.attach(io: URI.open(''), filename: '')

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
          product_id: 22,
          title: 'OK bag',
          body: 'it gets the job done but a but overpriced for what it has',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 1,
          product_id: 27,
          title: 'Sweet Balls',
          body: 'These golf balls are the best',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 28,
          title: 'Cool Balls',
          body: 'They look cool and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 4,
          product_id: 18,
          title: 'Great Putter',
          body: 'Wow this is the best putter ever',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 8,
          product_id: 15,
          title: 'Amazing Iron',
          body: 'Wow this is the best Iron pretty awesome',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 4
        })
        Review.create!({
          user_id: 4,
          product_id: 14,
          title: 'Super Awesome Amazing Iron',
          body: 'OMG this is the most super awesome amazing iron I\'ve ever used ever',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 1,
          product_id: 24,
          title: 'This bag is pretty good',
          body: 'This bag is good but it is has already started to wear out a bit after only 6 months',
          rating: 3,
          value: 4,
          quality: 4,
          durability: 2
        })
        Review.create!({
          user_id: 10,
          product_id: 22,
          title: 'Good bag',
          body: 'it gets the job done but a and is reasonably priced',
          rating: 4,
          value: 4,
          quality: 4,
          durability: 4
        })
        Review.create!({
          user_id: 7,
          product_id: 28,
          title: 'Great Balls Of Fire',
          body: 'These golf balls are the coolest design and they hit hella straight',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 6,
          product_id: 32,
          title: 'Coolest Balls Around',
          body: 'They look sooo cool with the dog paw design and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 10,
          product_id: 36,
          title: 'Great Balls',
          body: 'Wow these are the coolest balls ever I love representing the Islands when I\'m golfing',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 3,
          product_id: 11,
          title: 'Iconic Driver',
          body: 'The Big Bertha is one of the most iconic drivers out there and it hits great',
          rating: 4,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 13,
          product_id: 12,
          title: 'Super Awesome Amazing Wedge',
          body: 'OMG this is the most super awesome amazing wedge I\'ve ever used ever',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 15,
          product_id: 14,
          title: 'best Wedge',
          body: 'Wow this wedge hits great it gets a perfect loft for me every time!',
          rating: 4,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 13,
          product_id: 35,
          title: 'Chill Vibes Bro',
          body: 'These surf board golf balls give me chill vibes when golfing bro',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 1,
          product_id: 27,
          title: 'Sweet Balls',
          body: 'These golf balls are the best',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 30,
          title: 'Cool Balls',
          body: 'They look cool and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 14,
          product_id: 38,
          title: 'Great Putter',
          body: 'Wow this is the best putter I have ever used',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 12,
          product_id: 39,
          title: 'Cool Gloves',
          body: 'Wow these gloves have a pretty cool design but they are a little rough',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 4
        })
        Review.create!({
          user_id: 13,
          product_id: 40,
          title: 'Perfect Gloves',
          body: 'These Gloves really upped my game',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 12,
          product_id: 41,
          title: 'Real Lucky Gloves',
          body: 'These gloves totally got my game going in the right direction!',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 10,
          product_id: 42,
          title: 'Good Gloves',
          body: 'cost effective and comfortable gloves',
          rating: 5,
          value: 4,
          quality: 4,
          durability: 4
        })
        Review.create!({
          user_id: 7,
          product_id: 37,
          title: 'Great Balls Of Fire',
          body: 'These golf balls are the coolest design and they hit hella straight',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 6,
          product_id: 32,
          title: 'Coolest Balls Around',
          body: 'They look sooo cool with the mothers day design and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 4
        })
        Review.create!({
          user_id: 10,
          product_id: 13,
          title: 'Great wedge',
          body: 'Wow this is the best wedge ever',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 6,
          title: 'Amazing Hybrid',
          body: 'Wow this is the best hybrid. It\'s pretty awesome',
          rating: 4,
          value: 4,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 6,
          product_id: 7,
          title: 'Super Awesome Amazing Hybrid',
          body: 'OMG this is the most super awesome amazing hybrid I\'ve ever used ever',
          rating: 4,
          value: 4,
          quality: 4,
          durability: 4
        })
        Review.create!({
          user_id: 12,
          product_id: 8,
          title: 'best wood',
          body: 'Wow this wood hits like a driver I am shocked',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 3,
          product_id: 9,
          title: 'best wood',
          body: 'Wow this wood hits like a driver I am shocked',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 10,
          product_id: 10,
          title: 'Great wood',
          body: 'Wow this wood hits like a driver I am shocked',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 2,
          product_id: 12,
          title: 'Cool wedge',
          body: 'They look cool and hit the ball great!',
          rating: 4,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 14,
          product_id: 19,
          title: 'Great Putter',
          body: 'Wow this is the best putter ever',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 3,
          product_id: 15,
          title: 'Amazing Iron',
          body: 'Wow this is a great Iron',
          rating: 4,
          value: 4,
          quality: 4,
          durability: 4
        })
        Review.create!({
          user_id: 4,
          product_id: 14,
          title: 'Super Awesome Amazing Iron',
          body: 'OMG agreed this is the most super awesome amazing driver I\'ve ever used ever',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 5,
          product_id: 24,
          title: 'This bag is pretty good',
          body: 'This bag is allright but it is has already started to rip a bit',
          rating: 4,
          value: 4,
          quality: 3,
          durability: 3
        })
        Review.create!({
          user_id: 9,
          product_id: 22,
          title: 'Good bag',
          body: 'it gets the job done but a and is reasonably priced but just so-so',
          rating: 3,
          value: 3,
          quality: 3,
          durability: 3
        })
        Review.create!({
          user_id: 5,
          product_id: 30,
          title: 'Great Balls Of Fire',
          body: 'These golf balls are the coolest design and they hit hella straight',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 6,
          product_id: 34,
          title: 'Coolest Balls Around',
          body: 'They look sooo cool with the design and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 10,
          product_id: 35,
          title: 'Great Balls',
          body: 'Wow these are the coolest balls ever I love representing the Cali when I\'m golfing',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 13,
          product_id: 11,
          title: 'Iconic Driver',
          body: 'The Big Bertha is Amazing',
          rating: 4,
          value: 5,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 13,
          product_id: 14,
          title: 'Super Awesome Amazing Wedge',
          body: 'OMG this is the most super awesome amazing wedge I\'ve ever used ever',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 15,
          product_id: 12,
          title: 'good Wedge',
          body: 'Wow this wedge hits great but seems a little dinged up after a few outings',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 3
        })
        Review.create!({
          user_id: 11,
          product_id: 34,
          title: 'Chillin',
          body: 'These cali-balls give me chill vibes man',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 12,
          product_id: 27,
          title: 'Sweet Balls',
          body: 'These golf balls are great',
          rating: 5,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 10,
          product_id: 29,
          title: 'Cool Balls',
          body: 'They look cool and are easily recognizable but they dont travel the best for some reason!',
          rating: 3,
          value: 4,
          quality: 5,
          durability: 4
        })
        Review.create!({
          user_id: 14,
          product_id: 38,
          title: 'Awesome Putter',
          body: 'Wow this is the most interesting putter I have ever used',
          rating: 3,
          value: 4,
          quality: 3,
          durability: 3
        })
        Review.create!({
          user_id: 12,
          product_id: 39,
          title: 'Meh Gloves',
          body: 'Wow these gloves have a pretty cool design but they aren\'t very effective',
          rating: 2,
          value: 3,
          quality: 2,
          durability: 4
        })
        Review.create!({
          user_id: 13,
          product_id: 40,
          title: 'Good Gloves',
          body: 'These Gloves are pretty good but expensinve',
          rating: 3,
          value: 3,
          quality: 3,
          durability: 3
        })
        Review.create!({
          user_id: 14,
          product_id: 41,
          title: 'Lucky Of the Irish',
          body: 'I hit a hole in one with these babies... it was definitely the gloves!',
          rating: 5,
          value: 5,
          quality: 5,
          durability: 5
        })
        Review.create!({
          user_id: 9,
          product_id: 42,
          title: 'Pretty Good Gloves',
          body: 'cost effective and comfortable gloves',
          rating: 3,
          value: 3,
          quality: 3,
          durability: 4
        })

        puts "done creating reviews"
        puts ""
