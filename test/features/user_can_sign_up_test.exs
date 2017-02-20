defmodule AddUsersTest do
  use Renter.FeatureCase

  test "user sign up" do
    navigate_to("/sign_up")

    fill_in("user[email]", "email@email.com")
    fill_in("user[password]", "password")
    fill_in("user[password_confirmation]", "password")
    submit("user")

    assert visible_page_text  =~ gettext("Successfully signed up!")
  end
end
