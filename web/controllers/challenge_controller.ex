defmodule Challengesapp.ChallengeController do
  use Challengesapp.Web, :controller

  alias Challengesapp.Challenge

  plug :scrub_params, "challenge" when action in [:create, :update]

  def index(conn, _params) do
    challenges = Repo.all(Challenge)
    render(conn, "index.json", challenges: challenges)
  end

  def create(conn, %{"challenge" => challenge_params}) do
    changeset = Challenge.changeset(%Challenge{}, challenge_params)

    case Repo.insert(changeset) do
      {:ok, challenge} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", challenge_path(conn, :show, challenge))
        |> render("show.json", challenge: challenge)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Challengesapp.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)
    render(conn, "show.json", challenge: challenge)
  end

  def update(conn, %{"id" => id, "challenge" => challenge_params}) do
    challenge = Repo.get!(Challenge, id)
    changeset = Challenge.changeset(challenge, challenge_params)

    case Repo.update(changeset) do
      {:ok, challenge} ->
        render(conn, "show.json", challenge: challenge)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Challengesapp.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    challenge = Repo.get!(Challenge, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(challenge)

    send_resp(conn, :no_content, "")
  end
end
