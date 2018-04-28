Types::UserType = GraphQL::ObjectType.define do
  name 'UserType'

  field :id, types.ID
  field :name, types.String
  field :email, types.String
  field :phone_number, types.Int
  field :is_admin, types.Boolean, "Usuario administrador?"

  field :country do
    type Types::CountryType
    description "País associado a este usuário"

    resolve -> (user, args, ctx) {
      user.country
    }
  end
end
