class Movie < ApplicationRecord
    validates :name, uniqueness: true
    def self.search(search)
        search ? where('name LIKE ? OR description LIKE ?', "%#{search}%","%#{search}%") : all
    end
end
