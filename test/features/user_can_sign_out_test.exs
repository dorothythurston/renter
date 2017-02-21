defmodule UserSignoutTest do
  use Renter.FeatureCase
  import Renter.Factory

  test "user can sign out", %{conn: conn} do
    user = insert(:user)
    navigate_to dashboard_path(conn, :show, as: user.id)
    click_role("sign-out")

    assert visible_page_text  =~ gettext("You have been logged out")
  end
end
