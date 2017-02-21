defmodule Renter.Plug.Authenticate do
  import Plug.Conn
  import Phoenix.Controller
  import Renter.Gettext
  alias Renter.Repo
  alias Renter.User

  def init(default), do: default

  def call(conn, _) do
    current_user_id = get_session(conn, :current_user_id)
    if current_user_id do
      assign_current_user(conn, current_user_id)
    else
      redirect_to_sign_in(conn)
    end
  end

  defp assign_current_user(conn, current_user_id) do
    current_user = Repo.get(User, current_user_id)
    if current_user do
      assign(conn, :current_user, current_user)
    else
      clear_session(conn)
      redirect_to_sign_in(conn)
    end
  end

  defp redirect_to_sign_in(conn) do
    conn
      |> put_flash(:error, gettext("You need to be signed in to view this page"))
      |> redirect(to: Renter.Router.Helpers.sign_up_path(conn, :new))
      |> halt
  end
end
