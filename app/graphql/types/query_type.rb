Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :pdv, Types::PdvType do
    argument :id, !types.Int
    resolve -> (obj, args, ctx) {
      Pdv.find(args[:id])
    }
  end

  field :searchPdv, Types::PdvType do
    argument :lng, !types.Float
    argument :lat, !types.Float
    resolve -> (obj, args, ctx) {
      Pdv.search_by_coordinates(args[:lng], args[:lat])
    }
  end
end
