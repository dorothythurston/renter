defmodule Renter.User do
  use Renter.Web, :model

  schema "users" do
    field :email, :string
    field :password_digest, :string

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password_digest])
    |> validate_required([:email, :password_digest])
    |> unique_constraint(:email, name: :users_email_index)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
  end
end
