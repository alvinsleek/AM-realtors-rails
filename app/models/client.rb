class Client < ApplicationRecord
    name: string
    email: string
    phone: string

   
    has_many :properties
    has_many :payments
end
