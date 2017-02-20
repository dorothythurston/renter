defmodule Renter.Session do
  alias Renter.Repo
  alias Renter.User

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user_id)

    if id do
      Repo.get(User, id)
    end
  end

  def signed_in?(conn) do
    !!current_user(conn)
  end
end
