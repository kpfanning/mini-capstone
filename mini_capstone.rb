require "Unirest"

response = Unirest.get("http://localhost:3000/product_url")

body = response.body

print body