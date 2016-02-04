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
      accepted_at: challenge.accepted_at,
      fulfilled_at: challenge.fulfilled_at,
      receiver_id: challenge.receiver_id,
      sender_id: challenge.sender_id,
      began_at: challenge.began_at}
  end
end
