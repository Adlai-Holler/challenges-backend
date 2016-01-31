defmodule Challengesapp.User do
  use Challengesapp.Web, :model

  schema "users" do
    field :email, :string
    field :username, :string
    field :password, :string

    timestamps
  end

  @required_fields ~w(email username password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
