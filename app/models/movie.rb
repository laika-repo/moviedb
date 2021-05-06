class Movie < ApplicationRecord
    scope :by_average_rating, -> {all.to_a.sort_by(&:average_rating).reverse}

    has_many :reviews
    has_many :users, through: :review

    def average_rating
        reviews.average(:stars) || 0
    end 
end
