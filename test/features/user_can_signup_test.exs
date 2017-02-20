defmodule AddUsersTest do
  use Renter.FeatureCase

  test "user sign up" do
    navigate_to("/signup")

    fill_in("user[email]", "email@email.com")
    fill_in("user[password_digest]", "password")
    submit("user")

    assert visible_page_text  =~ gettext("Successfully signed up!")
  end
end
