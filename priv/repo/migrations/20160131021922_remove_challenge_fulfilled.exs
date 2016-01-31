defmodule Challengesapp.Repo.Migrations.RemoveChallengeFulfilled do
  use Ecto.Migration

  def change do
	alter table(:challenges) do
  		remove :fulfilled
  	end
  end
end
