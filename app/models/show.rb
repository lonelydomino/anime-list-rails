class Show < ApplicationRecord
    has_many :showlists
    has_many :lists, through: :showlists
    validates :name, presence: true
end
