class Category < ApplicationRecord

    has_many :articles, dependent: :restrict_with_exception
end
