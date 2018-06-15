class Pdv < ApplicationRecord
  validates_presence_of :tradingName, :ownerName, :document, :coverageArea, :address
end
