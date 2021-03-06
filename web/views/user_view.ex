defmodule Challengesapp.UserView do
  use Challengesapp.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Challengesapp.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Challengesapp.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      password: user.password}
  end
end
