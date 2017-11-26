class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

 # def is_discounted
    
 # end

  def as_json
  {
  id: 3,
  name: name,
  price: price,
  image: "",
  description: description,
  created_at: created_at,
  updated_at: updated_at
  }
  end

    
 
end
