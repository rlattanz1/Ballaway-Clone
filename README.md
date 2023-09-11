# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby 3.1.1

* Livelink: https://ballaway.onrender.com

* Features:

1. User Authentification for secure login user Experience

![secure user login](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/login.png?raw=true)

![secure user logout](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/logout.png?raw=true)

2.  Review create, update, and delete ability specific to each user for the products they like or don't like

![creating a review](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/create_reviews.png?raw=true)

![updating a review](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/update_reviews.png?raw=true)

![seeing product reviews](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/product_reviews.png?raw=true)

3. Shopping Cart specific to each user that allows each user to add, update quantity, or delete products they want or don't want

![utilizing a cart](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/cart.png?raw=true)

4. Categories browsing and Search bar browsing for specific products

![utilizing a search bar](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/categories.png?raw=true)

![utillizing a categories filter](https://raw.github.com/rlattanz1/Ballaway-Clone/main/images/search.png?raw=true)

* Installation Instructions:
To get started with Ballaway locally, follow these steps:

1. Clone the repository: git clone https://github.com/rlattanz1/Ballaway-Clone

2. Install the required dependencies: cd Ballaway bundle install npm install

3. Set up the database: rails db:create rails db:migrate rails db:seed

4. Start the Rails server: rails s

5. Open a new terminal window and start the React development server: cd frontend npm install npm start

6. Visit http://localhost:3000 in your browser to explore the app locally.

* Technologies Used:
1. Backend: Ruby on Rails
2. Frontend: React, Redux, JavaScript, HTML5, CSS3
3. Database: PostgreSQL
4. Image Hosting: Amazon S3
5. Deployment: Render

* Future Plans:
1. Add another CRUD feature to allow users to reserve times to get a personalized club fitting and show the reservations on their user profile
2. Add a Store Locator using the Google Maps API
3. Add a purchase history in the user profile that shows what Items have been purchased in the past and when they were purchased by that user
