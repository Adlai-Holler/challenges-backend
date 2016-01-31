defmodule Challengesapp.Challenge do
  use Challengesapp.Web, :model

  schema "challenges" do
    field :title, :string
    field :seen, :boolean, default: false
    field :accepted, :boolean, default: false
    field :fulfilled, :boolean, default: false
    belongs_to :receiver, Challengesapp.Receiver
    belongs_to :sender, Challengesapp.Sender

    timestamps
  end

  @required_fields ~w(title seen accepted fulfilled)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
