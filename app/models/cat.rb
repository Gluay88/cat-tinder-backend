class Cat < ApplicationRecord
    validates :name, :age, :enjoys, :image, presence: { message: "You are missing something!" }
    # validates :age, numericality: { in: 0..40 }
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40, message: "%{value} is not a valid age!" }
    
    validates :enjoys, length: { minimum: 10}
end

