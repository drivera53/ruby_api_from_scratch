class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :trades
    has_many :coins

    # validates :name, presence: true
    # validates :description, presence: true
    # validates :initial_balance, presence: true, numericality: { only_integer: true }
end
