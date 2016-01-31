defmodule Challengesapp.Repo.Migrations.ChallengeReplaceAcceptedWAcceptedat do
  use Ecto.Migration

  def change do
  	alter table(:challenges) do
  		remove :accepted
  		add :accepted_at, :datetime
  	end
  end
end
