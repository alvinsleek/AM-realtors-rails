class Payment < ApplicationRecord

  amount :decimal

  belongs_to :client
  
end
