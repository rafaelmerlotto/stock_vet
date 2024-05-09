class Article < ApplicationRecord
    validates :name, presence: true
    validates :note, presence: true, length: {minimum: 10} 
    validates :quantity, presence: true

    belongs_to :category
end
