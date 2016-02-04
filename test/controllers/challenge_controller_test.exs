defmodule Challengesapp.ChallengeControllerTest do
  use Challengesapp.ConnCase

  alias Challengesapp.Challenge
  @valid_attrs %{seen: true, title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, challenge_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = get conn, challenge_path(conn, :show, challenge)
    assert json_response(conn, 200)["data"] == %{"id" => challenge.id,
      "title" => challenge.title,
      "seen" => challenge.seen,
      "began_at" => challenge.began_at,
      "accepted_at" => challenge.accepted_at,
      "fulfilled_at" => challenge.fulfilled_at,
      "receiver_id" => challenge.receiver_id,
      "sender_id" => challenge.sender_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, challenge_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, challenge_path(conn, :create), challenge: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Challenge, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, challenge_path(conn, :create), challenge: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = put conn, challenge_path(conn, :update, challenge), challenge: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Challenge, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = put conn, challenge_path(conn, :update, challenge), challenge: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    challenge = Repo.insert! %Challenge{}
    conn = delete conn, challenge_path(conn, :delete, challenge)
    assert response(conn, 204)
    refute Repo.get(Challenge, challenge.id)
  end
end
