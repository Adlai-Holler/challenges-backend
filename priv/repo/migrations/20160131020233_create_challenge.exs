defmodule Challengesapp.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :title, :string
      add :seen, :boolean, default: false
      add :accepted, :boolean, default: false
      add :fulfilled, :boolean, default: false
      add :receiver_id, references(:users, on_delete: :nothing)
      add :sender_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:challenges, [:receiver_id])
    create index(:challenges, [:sender_id])

  end
end
