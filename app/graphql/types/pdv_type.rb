Types::PdvType = GraphQL::ObjectType.define do
  name 'Pdv'

  field :id, !types.ID
  field :tradingName, !types.String
  field :ownerName, !types.String
  field :document, !types.String
  field :coverageArea, !types.String
  field :address, !types.String
end
