defmodule Renter.UserTest do
  use Renter.ModelCase

  alias Renter.User
  import Renter.Factory

  @valid_attrs %{email: "some@email.com", password: "some password", password_confirmation: "some password"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset is invalid if email is used already (case sensitive)" do
    user = insert(:user)
    upcased_email = String.upcase(user.email)
    invalid_attrs = Map.merge(@valid_attrs, %{email: upcased_email})
    changeset = User.changeset(%User{}, invalid_attrs)

    assert {:error, changeset} = Renter.Repo.insert(changeset)
    assert changeset.errors[:email] == {"has already been taken", []}
  end

  test "changeset is invalid if email does not match email format" do
    changeset = User.changeset(%User{}, %{email: "notanemail"})

    assert {:error, changeset} = Renter.Repo.insert(changeset)
    assert changeset.errors[:email] == {"has invalid format", [validation: :format]}
  end

  test "changeset is invalid if password does not match password_confirmation" do
    invalid_attrs = Map.merge(@valid_attrs, %{password_confirmation: "not that password"})
    changeset = User.changeset(%User{}, invalid_attrs)

    assert {:error, changeset} = Renter.Repo.insert(changeset)
    assert changeset.errors[:password_confirmation] == {"passwords do not match", [validation: :confirmation]}
  end
end
