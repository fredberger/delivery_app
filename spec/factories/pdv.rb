FactoryBot.define do
  factory :pdv do
    tradingName "Adega da Cerveja - Pinheiros"
    ownerName "Zé da Silva"
    document "1432132123891/0001"
    coverageArea {
      {
        type: "MultiPolygon",
        coordinates: [[[[30, 20],[45, 40],[10, 40],[30, 20]]]]
      }
    }
    address {
      {
        type: "Point",
        coordinates: [-46.57421, -21.785741]
      }
    }
  end
end
