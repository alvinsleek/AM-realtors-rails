class Property < ApplicationRecord

    name: string
    address: string
    rent:decimal

    has_many :clients
end
