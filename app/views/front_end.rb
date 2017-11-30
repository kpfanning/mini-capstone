require "Unirest"
require "pp"

while true
  system "clear"

  puts "Welcome to the Pet Store!"
  puts "[1] See all products"
  puts "  [1.1] Search products by name"
  puts "  [1.2] Search by price"
  puts "[2] Create a product"
  puts "[3] See a product"
  puts "[4] Update a product"
  puts "[5] Delete a product"
  puts "[order] Place order" 
  puts
  puts "[signup] signup new user"
  puts "[login] Login (create a jwt)"
  puts "[logout] Logout (destroy a jwt)"
  puts "[q] Quit"

  input = gets.chomp

  if input == "1"
    response = Unirest.get("http://localhost:3000/v1/products") 
    products = response.body
    pp products

  elsif input == "1.1"
    puts "Enter name to search"
    search = gets.chomp
    puts "Here are the search names"
    response = Unirest.get("http://localhost:3000/v1/products?search=#{search}")
    pp response.body

  elsif input == "1.2"
    puts "Enter price to search"
    search = gets.chomp
    puts "Here is the price search"
    response = Unirest.get("http://localhost:3000/v1/products?search=#{search}")
    pp response.body

  elsif input == "2"
    params = {}
    print "Enter a product name: "
    params["name"] = gets.chomp
    print "Enter a product price: "
    params["price"] = gets.chomp
    print "Enter a product image: "
    params["image"] = gets.chomp
    print "Enter a product description: "
    params["description"] = gets.chomp
    response =  Unirest.post("http://localhost:3000/v1/products", parameters: params)
    product = response.body
    pp product

  elsif input == "3"
    puts "What product would you like to see?"
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    products = response.body
    pp products

  elsif input == "4"
    puts "What product would you like to update?"
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    params = {}
    print "Enter a product name: "
    params["name"] = gets.chomp
    print "Enter a product price: "
    params["price"] = gets.chomp
    print "Enter a product image: "
    params["image"] = gets.chomp
    print "Enter a product description: "
    params["description"] = gets.chomp
    response =  Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
    product = response.body
    pp product

  elsif input == "5"
    puts "What product would you like to delete?"
    product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
    products = response.body
    pp products

  elsif input == "order"
    puts "What product would you like to order?"
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    pp product
    params = {}
    print "Enter a product id: "
    params["product_id"] = gets.chomp
    print "Enter a product quantity: "
    params["quantity"] = gets.chomp
    params["price"] = product["price"]
    response = Unirest.post("http://localhost:3000/v1/orders", parameters: params)
    pp response.body
      

  elsif input == "signup"
    params = {}
    print "Name: "
    params[:name] = gets.chomp
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    print "Password confirmation: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
    pp response.body

  elsif input == "login"
    print "Enter email: "
    email = gets.chomp
    print "Enter password: "
    password = gets.chomp
    response = Unirest.post("http://localhost:3000/user_token", 
      parameters: {
        auth: {
          email: email,
          password: password
        }
      }
    )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    pp response.body

  elsif input == "logout"
    jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out successfully!"

  elsif input == "q"
    puts "Goodbye!"
    break
    puts 
    puts "Press enter to continue"
    gets.chomp
  end

  puts "Press enter to continue"
  gets.chomp

end
