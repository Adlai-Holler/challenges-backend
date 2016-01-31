defmodule Challengesapp.ChallengeTest do
  use Challengesapp.ModelCase

  alias Challengesapp.Challenge

  @valid_attrs %{accepted: true, fulfilled: true, seen: true, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
