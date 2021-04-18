class List < ApplicationRecord
    belongs_to :user
    has_many :showlists
    has_many :shows, through: :showlists
    validates :name, presence: true, uniqueness: true
        
end
