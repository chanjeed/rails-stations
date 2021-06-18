class Movie < ApplicationRecord
    validates :name, uniqueness: true
    def self.search(search)
        search ? where('name LIKE ?', "%#{search}%") : all
    end
end
