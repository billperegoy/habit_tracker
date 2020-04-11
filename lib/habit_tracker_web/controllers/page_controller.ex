defmodule HabitTrackerWeb.PageController do
  use HabitTrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
