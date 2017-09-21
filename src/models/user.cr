class User < Crecto::Model
  schema "users" do
    field :first_name, String
    field :last_name, String
    field :age, Int32
    field :height, Float64
  end
end
