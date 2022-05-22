defmodule MyApp.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end
end
