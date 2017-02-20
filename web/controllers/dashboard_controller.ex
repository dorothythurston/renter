defmodule Renter.DashboardController do
  use Renter.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end
end
