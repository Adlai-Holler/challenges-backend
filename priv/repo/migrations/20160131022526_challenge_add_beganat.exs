defmodule Challengesapp.Repo.Migrations.ChallengeAddBeganat do
  use Ecto.Migration

  def change do
  	alter table(:challenges) do
  		add :began_at, :datetime
  	end
  end
end
