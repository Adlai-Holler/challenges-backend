defmodule Challengesapp.ChallengeView do
  use Challengesapp.Web, :view

  def render("index.json", %{challenges: challenges}) do
    %{data: render_many(challenges, Challengesapp.ChallengeView, "challenge.json")}
  end

  def render("show.json", %{challenge: challenge}) do
    %{data: render_one(challenge, Challengesapp.ChallengeView, "challenge.json")}
  end

  def render("challenge.json", %{challenge: challenge}) do
    %{id: challenge.id,
      title: challenge.title,
      seen: challenge.seen,
      accepted: challenge.accepted,
      fulfilled: challenge.fulfilled,
      receiver_id: challenge.receiver_id,
      sender_id: challenge.sender_id}
  end
end
