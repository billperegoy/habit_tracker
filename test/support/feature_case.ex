defmodule HabitTrackerWeb.FeatureCase do
  @moduledoc """
  This module defines the test case to be used by
  teture tests that use wallaby.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias HabitTracker.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import HabitTrackerWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(HabitTracker.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(HabitTracker.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(HabitTracker.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
