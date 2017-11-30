class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_many :orders
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end

  def as_json
    {
      id: id,
      name: name,
      price: price,
      description: description,
      created_at: created_at,
      updated_at: updated_at,
      supplier_id: supplier.as_json
    }
  end

    
 
end
