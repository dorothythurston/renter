defmodule Renter.User do
  use Renter.Web, :model
  alias Renter.Password

  schema "users" do
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation])
    |> validate_required([:email])
    |> unique_constraint(:email, name: :users_email_index)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> validate_length(:password, min: 1)
    |> validate_length(:password_confirmation, min: 1)
    |> validate_confirmation(:password, message: "passwords do not match")
    |> hash_password
  end

  defp hash_password(changeset) do
    Password.encrypt(changeset)
  end
end
