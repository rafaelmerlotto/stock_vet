class Article < ApplicationRecord
    
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        name: "A",
        note: "B"
    }

    ORDER_BY = {
        recent: "created_at DESC",
        max_quantity: "quantity DESC",
        min_quantity: "quantity ASC"
      
    }

    validates :name, presence: true
    validates :note, presence: true
    validates :quantity, presence: true

    belongs_to :category
end
