class Coin < ApplicationRecord
    belongs_to :user
    belongs_to :portfolio 
end
