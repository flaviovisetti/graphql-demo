Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :user, Types::UserType do
    argument :id, types.ID
    description "Identificação de Usuário"

    resolve -> (obj, args, ctx) {
      User.where(id: args[:id]).first
    }
  end

  field :allUsers, types[Types::UserType] do
    description 'Retorna todos Usuários'

    resolve -> (obj, args, ctx) {
      User.all
    }
  end
end
