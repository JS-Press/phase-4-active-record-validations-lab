class Author < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
    validates :phone_number, length: { is: 10 }
end
