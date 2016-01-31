ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Challengesapp.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Challengesapp.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Challengesapp.Repo)

