defmodule Challengesapp.Repo.Migrations.AddChallengeFullfildate do
  use Ecto.Migration

  def change do
  	alter table(:challenges) do
  		add :fulfilled_at, :datetime
  	end
  end
end
