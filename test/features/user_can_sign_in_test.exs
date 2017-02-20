defmodule NewSessionTest do
  use Renter.FeatureCase
  import Renter.Factory

  test "user logs in" do
    user = insert(:user)
    navigate_to("/sign_in")
    fill_in("session[email]", user.email)
    fill_in("session[password]", user.password_digest)
    submit("session")

    assert role_visible?("sign-out")
  end

  test "user logs in with bad password" do
    user = insert(:user)
    navigate_to("/sign_in")
    fill_in("session[email]", user.email)
    fill_in("session[password]", "bad password")
    submit("session")

    assert visible_page_text  =~ gettext("Username or password are incorrect.")
    refute role_visible?("sign-out")
  end

  test "user logs in with non existing user" do
    navigate_to("/sign_in")
    fill_in("session[email]", "i@dontexist.com")
    fill_in("session[password]", "bad password")
    submit("session")

    assert visible_page_text  =~ gettext("Could not find a user with that username.")
    refute role_visible?("sign-out")
  end
end
