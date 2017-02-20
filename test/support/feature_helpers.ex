defmodule FeatureHelpers do
  use Hound.Helpers

  def fill_in(name, text) do
    {:name, name} |> fill_field(text)
  end

  def click_role(role_name) do
    role_name
    |> role_element
    |> click
  end

  def role_element(role_name) do
    {:css, "[data-role=#{role_name}]"}
  end

  def submit(role) do
    click_role("submit-#{role}")
  end

  def role_visible?(role_name) do
    element?(:css, "[data-role=#{role_name}]")
  end

  def user_navigate_to(url, as: user) do
   format_uri(url, user)
   |> navigate_to
  end

  defp format_uri(url, user) do
    url
    |> URI.parse
    |> append_query("as=#{user.id}")
    |> to_string
  end

  defp append_query(uri, query) do
    if uri.query do
      %{uri | query: "#{uri.query}&#{query}"}
    else
      %{uri | query: query}
    end
  end
end
