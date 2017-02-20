defmodule Renter.ViewHelpers do
  def signed_in?(conn) do
    !!conn.assigns[:current_user]
  end
end
