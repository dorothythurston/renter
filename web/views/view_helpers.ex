defmodule Renter.ViewHelpers do
  def signed_in?(conn) do
    Map.has_key?(conn.assigns, :current_user)
  end

  def current_user(conn) do
    conn.assigns[:current_user]
  end
end
