defmodule Renter.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Renter.Repo

  def user_factory do
    %Renter.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_digest: "password"
    }
  end
end
